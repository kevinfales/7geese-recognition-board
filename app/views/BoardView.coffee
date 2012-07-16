define [
    'backbone'
    'jquery'

    'lessc!less/views/BoardView.less'

    'app/jquery/jquery.masonry.min.js'
    'cs!app/views/RecognitionView'
    'cs!app/collections/RecognitionsCollection'
], ->
    Backbone = require 'backbone'
    $ = require 'jquery'

    RecognitionView = require 'cs!app/views/RecognitionView'
    RecognitionsCollection = require 'cs!app/collections/RecognitionsCollection'

    return class BoardView extends Backbone.View
        className: 'board-view'

        initialize: ->
            @recognitionsCollection = new RecognitionsCollection
            @recognitionsCollection.add @options.data

        centerBoard: ->
            $window = $ window

            recognitionViewWidth = @$el.find(".recognition-view").width()
            windowWidth          = $window.width()
            recognitionListWidth = ((windowWidth / (recognitionViewWidth + 10))|0) * recognitionViewWidth

            @$el.css "width": recognitionListWidth

        render: ->
            $(window).resize =>
                @centerBoard()


        renderRecognitions: ->
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
                    @centerBoard()