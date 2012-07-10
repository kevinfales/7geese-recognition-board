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

        recognitionClicked: =>
            window.open(@model.get('object').url)

        render: ->
            profileImage = new Image
            profileImage.src = @model.get('target').image_medium.url

            badgeImage = new Image
            badgeImage.src = @model.get('object').image_medium.url

            @$el.html template {}

            @$filler = @$el.find('.filler')

            @badgeView.render()
            @$filler.append @badgeView.el

            @commentsView.render()
            @$filler.append @commentsView.el

            @$el.find('.badge-view').click @recognitionClicked
