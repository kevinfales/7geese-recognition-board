define [
    'underscore'
    'backbone'

    'cs!app/views/LoginView'
    'cs!app/views/RecognitionView'
    'cs!app/models/RecognitionModel'
], (template) ->

    _ = require 'underscore'
    Backbone = require 'backbone'

    LoginView = require 'cs!app/views/LoginView'
    RecognitionView = require 'cs!app/views/RecognitionView'
    RecognitionModel = require 'cs!app/models/RecognitionModel'

    return class MainView extends Backbone.View
        initialize: ->
            # In the future, we might want to implement an auto-login system.
            #@currentView = new LoginView
            @currentView = new RecognitionView
                model: new RecognitionModel
                    target:
                        image_medium:
                            url: "https:\/\/7geesestorage.s3.amazonaws.com\/profile_images\/paltechsolutions.com\/1OsPtNPXJ2Gu4rMg7IbY.50x50.png"
                        displayName: "Amin Palizban"
                        url: "http:\/\/192.168.10.129:8000\/#paltechsolutions.com\/apalizban\/"
                    object:
                        image_medium:
                            url: "https:\/\/7geesestorage.s3.amazonaws.com\/badges\/passion.45x45.png"
                        displayName: "Passion"
                        url: "http:\/\/192.168.10.129:8000\/r\/TY"
                        published: "2012-06-15T23:08:15+00:00"
                    content: "Done something really awesome."
                    actor:
                        displayName: "Salehen Rahman"

        render: ->
            @currentView.render()
            @$el.html @currentView.el
            