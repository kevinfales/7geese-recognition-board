define [
    'backbone'
    'jquery'

    'app/jquery/jquery.masonry.min.js'
    'cs!app/views/RecognitionView'
    'cs!app/collections/RecognitionsCollection'
], ->
    Backbone = require 'backbone'
    $ = require 'jquery'

    RecognitionView = require 'cs!app/views/RecognitionView'
    RecognitionsCollection = require 'cs!app/collections/RecognitionsCollection'

    return class BoardView extends Backbone.View
        initialize: ->
            @recognitionsCollection = new RecognitionsCollection
            @recognitionsCollection.fetch().done =>
                @render()

        render: =>
            ###
            This will render all the recognitions. The code here is separate
            from the main one since logically 
            ###

            $ =>
                @$el.css
                    opacity: 0
                    scale: 0.925

                @recognitionsCollection.forEach (model) =>
                    recognitionView = new RecognitionView
                        model: model

                    recognitionView.render()
                    @$el.append recognitionView.el

                @$el.masonry
                    itemSelector: '.recognition-view'

                @$el.transition
                    opacity: 1
                    scale: 1
                , 500
                , =>
                    @$el.find('.recognition-view').addClass('animate');