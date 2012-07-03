define [
    # Texts.
    'text!templates/main.html'

    'underscore'
    'backbone'

    'cs!app/views/LoginView'
], (template) ->

    _ = require 'underscore'
    Backbone = require 'backbone'

    LoginView = require 'cs!app/views/LoginView'

    template = _.template require 'text!templates/main.html'

    return class MainView extends Backbone.View
        initialize: ->
            # In the future, we might want to implement an auto-login system.
            @currentView = new LoginView

        render: ->
            @currentView.render()
            @$el.html @currentView.el
            