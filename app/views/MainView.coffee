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
            @currentView.on 'formSubmitted', @logInSubmitted
            #@currentView = new BoardView

        render: ->
            @currentView.render()
            @$el.html @currentView.el

        logInSubmitted: =>
            @currentView.remove()

            @currentView = new BoardView

            @render()
            