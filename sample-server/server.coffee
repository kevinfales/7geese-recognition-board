express          = require 'express'
credentials      = require './credentials.coffee'
recognitionBoard = require './recognition-board.coffee'

app = express.createServer()

port = 4000

app.configure ->
    app.use express.bodyParser()
    app.use express.methodOverride()
    app.use app.router

sendJSON = (obj, req, res, code=200) ->
    data = JSON.stringify obj
    contentType = "application/json"

    if req.query.format? and req.query.format is 'jsonp'
        unless req.query.callback?
            req.query.callback = 'callback'

        data = "#{req.query.callback}(#{data});"

        contentType = "text/javascript"

    res.contentType contentType
    res.send data, code

app.get '/api/v1/stream/', (req, res) ->
    if not req.query.verb? or req.query.verb isnt 'badge_awarded'
        sendJSON {message: 'error'}, req, res, 401
        return

    if req.query.username isnt credentials.username or req.query.api_key isnt credentials.token
        sendJSON {message: "not authorized"}, req, res, 401
        return

    sendJSON recognitionBoard.data, req, res

app.listen port

console.log "Username:  #{credentials.username}"
console.log "API Token: #{credentials.token}"

console.log "Express server listening on port #{port}"
