define 'app/views/LoginView', [
    'text!login-view-template.html'

    'backbone'
    'underscore'
], (template) ->
    Backbone = require 'backbone'
    _ = require 'underscore'

    return class LoginView extends Backbone.View
        render: ->
            @$el.html _.template template, {}