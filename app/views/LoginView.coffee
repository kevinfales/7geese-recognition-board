define [
    'lessc!less/views/LoginView.less'
    'text!templates/login.html'

    'app/jquery/jquery.serializeobject.js'
    'app/jquery/jquery.transit.min.js'

    'cs!app/statics'
    'cs!app/wrappers/Remote'

    'jquery'
    'backbone'
    'underscore'
], (template) ->

    Backbone = require 'backbone'
    _ = require 'underscore'
    $ = require 'jquery'

    template = _.template require 'text!templates/login.html'

    statics = require "cs!app/statics"

    Remote = require 'cs!app/wrappers/Remote'

    return class LoginView extends Backbone.View
        className: 'login-view'

        events:
            'submit form': 'formSubmitted'

        render: ->
            @$el.html template {}

            @form = @$el.find 'form'
            @pleaseWaitMessage = @$el.find '.please-wait-message'

            @pleaseWaitMessage.css
                y: '0px'
                opacity: 0

            @$el.css
                x: '-100px'
                opacity: 0

            @$el.transition
                x: '0px'
                opacity: 1
                delay: 200

        transitionOut: (cb) ->
            @$el.transition
                y: '-50px'
                opacity: 0
            , ->
                if cb?
                    cb()

        displayPleaseWait: ->
            @form.transition
                y: '-100px'
                opacity: 0

            @pleaseWaitMessage.transition
                y: '-100px'
                opacity: 1
                delay: 500

            return

        displayForm: (message) ->
            @form.transition
                y: '0px'
                opacity: 1

            @pleaseWaitMessage.transition
                y: '0px'
                opacity: 0

            if message?
                $intro = @$el.find('.intro')

                $intro.html message
                $intro.addClass 'error'

            return

        formSubmitted: (e) ->
            e.preventDefault()

            serializedForm = @form.serializeObject()

            remote = new Remote
            deferred = remote.checkAuth serializedForm.email, serializedForm['api-token']
            credentials = username: serializedForm.email,
            api_key: serializedForm['api-token']

            @displayPleaseWait()

            do =>
                canceled = false

                # TODO: make it a bit more user-friendly.
                setTimeout =>
                    canceled = true

                    @displayForm "Timed Out"
                , 10000

                deferred.done (data) =>
                    unless canceled
                        @trigger 'loginAccepted', credentials

                deferred.error =>
                    @displayForm "An error occured"
