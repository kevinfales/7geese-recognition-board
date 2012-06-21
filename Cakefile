child_process = require 'child_process'
fs = require 'fs'

outputStdout = (data) ->
    console.log data.toString('utf8').trim()

spawnProcess = (command, args) ->
    process = child_process.spawn command, args
    process.stdout.on 'data', outputStdout
    process.stderr.on 'data', outputStdout

    return process

createPackages = ->
    config = JSON.parse fs.readFileSync('config.json', 'utf8')

    args = ['install']

    for k, v of config.deps
        args.push "#{k}#{if v != '*' then '@'+v else ''}"

    jam = spawnProcess 'jam', args

    return jam

build = ->
    args = ['compile', '-i', 'app/main', '-o', 'jam/require.js']
    jam = spawnProcess 'jam', args

watchLess = ->
    args = ['--directory', 'less']
    less = spawnProcess 'watch-less', args

checkJamExists = ->
    jamExists = false
    try
        stats = fs.lstatSync('jam')

        if stats.isDirectory()
            jamExists = true
    catch e
        jamExists = false

    return jamExists

compileLess = ->
    lessc = spawnProcess 'lessc', ['less/style.less', 'less/style.less.css']
    return lessc

task 'packages', 'Install/update packages.', ->
    createPackages()

task 'build', 'Compile and compress the JavaScript code.', ->
    jamExists = checkJamExists

    if not jamExists
        createPackages().on 'exit', ->
            build()
    else
        build()

task 'run', 'Run the system', ->
    compileLess().on 'exit', ->
        createPackages().on 'exit', ->
            simpleServer = spawnProcess 'simple-server'
            watchLess()

task 'clean', 'Delete all unnecessary files.', ->
    spawnProcess 'rm', ['-rf', 'jam']
    spawnProcess 'rm', ['-f', 'less/style.less.css']
