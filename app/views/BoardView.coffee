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
            @recognitionsCollection.fetch success: =>
                @render()
                @recognitionsCollection.bind "add", @_prependNewRecognition
            setInterval =>
                @updateBoard()
            , 30000

            $(window).resize =>
                centerBoard()          

        centerBoard: ->
            $window = $ window

            recognitionViewWidth = @$el.find(".recognition-view").width()
            windowWidth          = $window.width()
            recognitionListWidth = ((windowWidth / (recognitionViewWidth + 10))|0) * recognitionViewWidth

            @$el.css "width": recognitionListWidth

        updateBoard: =>
            newRecognitions = new RecognitionsCollection
            successCallback = (collection, response) =>
                @recognitionsCollection.meta.offset = collection.meta.offset
                collection.each (model) =>
                    existingModel = @recognitionsCollection.get model.get("id")
                    if existingModel?
                        existingModel.set model.toJSON()
                    else
                        @recognitionsCollection.unshift model

                if collection.length
                    @$el.masonry 'reload'
            newRecognitions.fetch
                success: successCallback
                data:
                    poll: true
                    offset: @recognitionsCollection.meta.offset
        
        render: =>
            $ =>
                @$el.css
                    opacity: 0
                    scale: 0.925

                @recognitionsCollection.forEach (model) =>
                    @_addRecognition model

                @$el.masonry
                    itemSelector: '.recognition-view'

                @$el.transition
                    opacity: 1
                    scale: 1
                , 500
                , =>
                    @$el.find('.recognition-view').addClass('animate');

                @centerBoard()

        _prependNewRecognition: (model) =>
            @_addRecognition model, true
            @$el.masonry 'reload'
        _addRecognition: (model, prepend=false) =>
            recognitionView = new RecognitionView
                model: model

            recognitionView.render()
            if prepend then @$el.prepend(recognitionView.el) else @$el.append(recognitionView.el)
            recognitionView.$el.addClass 'animate'