define [
    'text!templates/badge.html'

    'lessc!less/views/BadgeView.less'

    'underscore'
    'backbone'
], ->
    
    _ = require 'underscore'
    Backbone = require 'backbone'

    template = _.template require 'text!templates/badge.html'

    return class Badge extends Backbone.View
        className: 'badge-view'

        initialize: ->
            if not @model?
                throw "No model has been defined."
            @model.bind "change", @render

        render: =>
            data = @model.toJSON()
            html =  template data
            @$el.html html
