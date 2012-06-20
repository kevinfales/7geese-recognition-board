child_process = require 'child_process'
fs = require 'fs'

outputStdout = (data) ->
    console.log data.toString('utf8').trim()

task 'packages', 'Install/update packages.', ->
    config = JSON.parse fs.readFileSync('config.json', 'utf8')

    args = ['install']

    for k, v of config.deps
        args.push "#{k}#{if v != '*' then '@'+v else ''}"

    jam = child_process.spawn 'jam', args

    jam.stdout.on 'data', outputStdout
    jam.stderr.on 'data', outputStdout

task 'clean', 'Delete all unnecessary files.', ->
    rm = child_process.spawn 'rm', ['-rf', 'jam']

    rm.stdout.on 'data', outputStdout
    rm.stderr.on 'data', outputStdout
