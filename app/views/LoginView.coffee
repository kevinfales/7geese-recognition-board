define [
    'lessc!less/views/LoginView.less'
    'text!templates/login.html'

    'js/jquery/jquery.serializeobject.js'

    'backbone'
    'underscore'
], (template) ->

    Backbone = require 'backbone'
    _ = require 'underscore'

    template = _.template require 'text!templates/login.html'

    return class LoginView extends Backbone.View
        className: 'login-view'

        events:
            'submit form': 'formSubmitted'

        render: ->
            @$el.html template {}

            @form = @$el.find 'form'

        formSubmitted: (e) ->
            e.preventDefault()

            @trigger 'formSubmitted', @form.serializeObject(), @form