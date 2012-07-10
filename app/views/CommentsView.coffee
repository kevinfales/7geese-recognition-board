define [
    'text!templates/comments.html'
    'lessc!less/views/CommentsView.less'

    'cs!app/statics'

    'jquery'
    'backbone'
    'moment'
], ->
    Backbone = require 'backbone'
    $ = require 'jquery'
    moment = require 'moment'

    template = _.template require 'text!templates/comments.html'
    statics = require 'cs!app/statics'

    return class CommentsView extends Backbone.View
        render: ->
            data = @model.toJSON()

            comments = null

            if data.comments.length > statics.maxComments
                comments = data.comments.slice data.comments.length - statics.maxComments, data.comments.length
            else
                comments = data.comments

            for comment in comments
                profilePic = new Image
                profilePic.src = comment.creator.profile_img

            if data.comments.length > 0
                @$el.html template
                    comments: comments
                    $: $
                    moment: moment
            else
                @$el.hide()
