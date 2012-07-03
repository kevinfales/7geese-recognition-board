define [
    'text!templates/recognition.html'
    'lessc!less/views/RecognitionView.less'

    'backbone'

    'cs!app/views/BadgeView'
    'cs!app/views/CommentsView'
], ->
    
    Backbone = require 'backbone'

    BadgeView = require 'cs!app/views/BadgeView'
    CommentsView = require 'cs!app/views/CommentsView'

    template = _.template require 'text!templates/recognition.html'

    return class RecognitionView extends Backbone.View
        className: 'recognition-view'

        initialize: ->
            @badgeView = new BadgeView
                model: @model

            @commentsView = new CommentsView
                model: @model

        render: ->
            @$el.html template {}

            @$filler = @$el.find('.filler')

            @badgeView.render()
            @$filler.append @badgeView.el

            @commentsView.render()
            @$filler.append @commentsView.el
