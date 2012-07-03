define [
    'underscore'
    'backbone'

    'cs!app/views/BoardView'
], (template) ->

    _ = require 'underscore'
    Backbone = require 'backbone'

    BoardView = require 'cs!app/views/BoardView'

    return class MainView extends Backbone.View
        initialize: ->
            # In the future, we might want to implement an auto-login system.
            #@currentView = new LoginView
            @currentView = new BoardView

        render: ->
            @currentView.render()
            @$el.html @currentView.el
            