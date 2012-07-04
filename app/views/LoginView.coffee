define [
    'lessc!less/views/LoginView.less'
    'text!templates/login.html'

    'app/jquery/jquery.serializeobject.js'

    'cs!app/statics'

    'jquery'
    'backbone'
    'underscore'
], (template) ->

    Backbone = require 'backbone'
    _ = require 'underscore'
    $ = require 'jquery'

    template = _.template require 'text!templates/login.html'

    statics = (require "cs!app/statics")()

    return class LoginView extends Backbone.View
        className: 'login-view'

        events:
            'submit form': 'formSubmitted'

        render: ->
            @$el.html template {}

            @form = @$el.find 'form'

        formSubmitted: (e) ->
            e.preventDefault()

            serializedForm = @form.serializeObject()

            query = "#{statics.hostname}/api/v1/stream/?verb=badge_awarded&username=#{serializedForm.email}&api_key=#{serializedForm['api-token']}&format=jsonp&callback=?"

            deferred = $.getJSON(query);

            deferred.success (data) =>
                @trigger 'loginAccepted', data

            deferred.error ->
                console.log "Awe! D:"