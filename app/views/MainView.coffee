define [
    'underscore'
    'backbone'

    'cs!app/views/BoardView'
    'cs!app/views/LoginView'
], (template) ->

    _ = require 'underscore'
    Backbone = require 'backbone'

    BoardView = require 'cs!app/views/BoardView'
    LoginView = require 'cs!app/views/LoginView'

    return class MainView extends Backbone.View
        initialize: ->
            # In the future, we might want to implement an auto-login system.
            @currentView = new LoginView
            @currentView.on 'loginAccepted', @logInAccepted
            
            return

        render: ->
            ###
            This will render the MainView.
            ###

            @currentView.render()
            @$el.html @currentView.el

            return

        logInAccepted: (data) =>
            ###
            Event handler for when the user logged in.

            @param object data: is a list of all recognitions that was given
                when the server successfully authenticated.
            ###

            @currentView.transitionOut =>
                @currentView.remove()
                @currentView = new BoardView
                    data: data.objects

                @render()

                @currentView.renderRecognitions()

            return
