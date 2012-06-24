child_process = require 'child_process'
async = require 'async'

outputStdout = (data) ->
    console.log data.toString('utf8').trim()

spawnChild = (command, args) ->
    process = child_process.spawn command, args

    process.stdout.on 'data', outputStdout
    process.stderr.on 'data', outputStdout

    return process

task 'build', 'Build and concatenate all script files.', ->
    async.waterfall [
        (callback) ->
            jam = spawnChild 'jam', ['install', 'jam.json']
            jam.on 'exit', ->
                callback null

        (callback) ->
            jam = spawnChild 'jam', ['compile', '-i', 'app/main', '-o', 'jam/require.js']
    ]

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
    async.waterfall [
        (callback) ->
            rm = spawnChild 'rm', ['-rf', 'jam']
    ]

task 'clean:all', 'Clear out all the unnecessary stuff, inscluding the node_modules folder.', ->
    async.waterfall [
        (callback) ->
            rm = spawnChild 'rm', ['-rf', 'jam']
            rm.on 'exit', ->
                callback null

        (callback) ->
            rm = spawnChild 'rm', ['-rf', 'node_modules']
            rm.on 'exit', ->
    ]
