child_process = require 'child_process'
async         = require 'async'
findit        = require 'findit'
fs            = require 'fs'
path          = require 'path'
mkdirp        = require 'mkdirp'
watch         = require 'watch'

outputStdout = (data) ->
    console.log data.toString('utf8').trim()

spawnChild = (command, args) ->
    process = child_process.spawn command, args

    process.stdout.on 'data', outputStdout
    process.stderr.on 'data', outputStdout

    return process

cleanCompiledLess = (cb) ->
    rm = spawnChild 'rm', ['-rf', 'less/.compiled']
    rm.on 'exit', ->
        if cb?
            cb()

buildLessFiles = (callback) ->

    lessPending = 0
    doneReading = false

    lessDone = ->
        lessPending--
        if doneReading and not lessPending and callback?
            callback()

    startLessc = (dir, file, outputFile) ->
        lessPending++
        mkdirp dir, '0777', ->
            lessc = spawnChild 'lessc', [ file, outputFile ]
            lessc.on 'exit', ->
                lessDone()

    cleanCompiledLess ->
        mkdirp "#{__dirname}/less/.compiled", "0777", (err, made) ->
            unless fs.readdirSync("#{__dirname}/less/").length > 1
                lessPending++
                doneReading = true
                lessDone()
                return

            if err?
                throw err

            finder = findit.find "#{__dirname}/less"

            finder.on 'file', (file, stat) ->
                relativeFilename = file.substr "#{__dirname}/less/".length
                outputFilename = "#{__dirname}/less/.compiled/#{relativeFilename}"
                outputDir = outputFilename.substr 0, outputFilename.lastIndexOf '/'
                isLess = path.extname(file) is '.less'

                if isLess
                    startLessc outputDir, file, outputFilename

            finder.on 'end', ->
                doneReading = true

cleanBuild = (cb) ->
    async.waterfall [
        (callback) ->
            make = spawnChild 'make', ['clean']
            make.on 'exit', ->
                callback null

        (callback) ->
            cleanCompiledLess ->
                if cb?
                    cb()
    ]

buildStaticLess = (cb) ->
    mkdirp "#{__dirname}/bin/css", "0777", (err, made) ->
        lessc = spawnChild 'lessc', [ "#{__dirname}/less/static/style.less", "#{__dirname}/bin/css/style.css", '--yui-compress' ]

        lessc.on 'exit', ->
            console.log "Less files built."
            if cb?
                cb()

        return lessc

watchLess = ->
    buildStaticLess ->
        createMonitor = (dir) ->
            watch.createMonitor dir, (monitor) ->
                monitor.on "created", ->
                    buildStaticLess()

                monitor.on "changed", (f, curr, prev) ->
                    unless curr.mtime.getTime() == prev.mtime.getTime()
                        buildStaticLess()

                monitor.on "removed", ->
                    buildStaticLess()

        createMonitor "#{__dirname}/less/static"
        createMonitor "#{__dirname}/less/lib"

doBuild = (cb) ->
    async.waterfall [
        (callback) ->
            cleanBuild ->
                callback null

        (callback) ->
            buildLessFiles ->
                callback null

        (callback) ->
            buildStaticLess ->
                callback null

        (callback) ->
            jam = spawnChild 'jam', [ 'install', 'jam.json' ]
            jam.on 'exit', ->
                callback null

        (callback) ->
            jam = spawnChild 'jam', [ 'compile', '-i', 'app/main', '-o', 'jam/require.js' ]
            jam.on 'exit', ->
                callback null

        (callback) ->
            if cb?
                cb()
    ]

task 'build-run', 'Build all script files, compile the static LESS, and run the server.', ->
    doBuild ->
        simpleServer = spawnChild 'simple-server'

task 'dist', 'Prepare the project for distribution.', ->
    doBuild ->
        make = spawnChild 'make', ['dist']


task 'deps:install', 'Install all dependencies for the client-side.', ->
    async.waterfall [
        (callback) ->
            jam = spawnChild 'jam', ['install', 'jam.json']
    ]

task 'deps:upgrade', 'Upgrade all dependencies for the client-side.', ->
    async.waterfall [
        (callback) ->
            jam = spawnChild 'jam', ['upgrade']
    ]

task 'clean', 'Clear out all the unnecessary stuff.', ->
    cleanBuild()

task 'clean:all', 'Clear out all the unnecessary stuff, inscluding the node_modules folder.', ->
    async.waterfall [
        (callback) ->
            cleanBuild ->
                callback()

        (callback) ->
            rm = spawnChild 'rm', ['-rf', 'node_modules']
            rm.on 'exit', ->
    ]

task 'run', 'Run a server.', ->
    async.waterfall [

        (callback) ->
            jam = spawnChild 'jam', [ 'install', 'jam.json' ]
            jam.on 'exit', ->
                callback null

        (callback) ->
            watchLess()
            simpleServer = spawnChild 'simple-server'
    ]
