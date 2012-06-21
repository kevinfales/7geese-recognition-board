define 'app/views/RecognitionView', ['backbone'] ->

    Backbone = require 'backbone'

    return class RecognitionView extends Backbone.View
        initialize: ->
            if !@model?
                throw "No model has been defined."

        render: ->

