define [
    'text!templates/login.html'

    'backbone'
    'underscore'
], (template) ->

    Backbone = require 'backbone'
    _ = require 'underscore'

    template = _.template require 'text!templates/login.html'

    return class LoginView extends Backbone.View
        events:
            'submit form': 'formSubmitted'

        render: ->
            @$el.html template {}

        formSubmitted: (e) ->
            e.preventDefault()

            console.log "The form has been submitted."