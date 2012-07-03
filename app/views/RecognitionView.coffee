define [
    'text!templates/recognition.html'
    'lessc!less/views/RecognitionView.less'

    'backbone'

    'cs!app/views/BadgeView'
], ->
    
    Backbone = require 'backbone'
    BadgeView = require 'cs!app/views/BadgeView'
    template = _.template require 'text!templates/recognition.html'

    return class RecognitionView extends Backbone.View
        className: 'recognition-view'

        initialize: ->
            @badgeView = new BadgeView
                model: @model

        render: ->
            @$el.html template {}

            @$filler = @$el.find('.filler')

            @badgeView.render()
            @$filler.append @badgeView.el
