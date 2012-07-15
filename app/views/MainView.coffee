define [
    'underscore'
    'backbone'

    'cs!app/wrappers/Remote'
    'app/lib/backbone-tastypie'

    'cs!app/views/BoardView'
    'cs!app/views/LoginView'
], (template) ->

    _ = require 'underscore'
    Backbone = require 'backbone'

    BoardView = require 'cs!app/views/BoardView'
    LoginView = require 'cs!app/views/LoginView'

    Remote = require 'cs!app/wrappers/Remote'

    return class MainView extends Backbone.View
        remote: new Remote
        initialize: ->
            Q = @_parseGetParams()
            if 'username' not of Q or 'api_key' not of Q
                username = ""
                api_key = ""
            else
                username = Q.username
                api_key = Q.api_key

            promise = @remote.checkAuth username, api_key

            promise.done (data) =>
                Backbone.Tastypie.apiKey.username = username
                Backbone.Tastypie.apiKey.key = api_key
                @renderRecognitionBoard()
            .fail =>
                # In the future, we might want to implement an auto-login system.
                @currentView = new LoginView
                @currentView.render()
                @render()
                @currentView.on 'loginAccepted', @logInAccepted
            
            return

        render: ->
            ###
            This will render the MainView.
            ###
            @$el.html @currentView.el if @currentView?

        _parseGetParams: ->
            query = {}
            search = location.search.substring(1).split("&")
            i = search.length;
            while (i--)
                pair = search[i].split '='
                query[pair[0]] = decodeURIComponent(pair[1])
            query

        logInAccepted: (data) =>
            ###
            Event handler for when the user logged in.

            @param object data: is a list of all recognitions that was given
                when the server successfully authenticated.
            ###

            @currentView.transitionOut =>
                Backbone.Tastypie.apiKey.username = data.username
                Backbone.Tastypie.apiKey.key = data.api_key
                @renderRecognitionBoard()
                

            return

        renderRecognitionBoard: =>
            @currentView?.remove()
            @currentView = new BoardView
            @render()
