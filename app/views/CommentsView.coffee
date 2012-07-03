define [
    'text!templates/comments.html'
    'lessc!less/views/CommentsView.less'

    'jquery'
    'backbone'
    'moment'
], ->
    Backbone = require 'backbone'
    $ = require 'jquery'
    moment = require 'moment'

    template = _.template require 'text!templates/comments.html'


    return class CommentsView extends Backbone.View
        render: ->
            data = @model.toJSON()
            @$el.html template
                comments: data.comments
                $: $
                moment: moment
