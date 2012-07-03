define [
    'text!templates/badge.html'

    'underscore'
    'backbone'
], ->
    
    _ = require 'underscore'
    Backbone = require 'backbone'

    template = _.template require 'text!templates/badge.html'

    return class Badge extends Backbone.View
        initialize: ->
            if !@model?
                throw "No model has been defined."

        render: ->
            data = @model.toJSON()
            html =  template data
            @$el.html html
