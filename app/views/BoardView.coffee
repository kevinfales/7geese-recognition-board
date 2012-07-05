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

    # TODO: Use the static variable to determine how many comments.

    return class BoardView extends Backbone.View
        initialize: ->
            @recognitionsCollection = new RecognitionsCollection
            @recognitionsCollection.on "add", @recognitionAdded

            @recognitionsCollection.add @options.data

        render: ->

        recognitionAdded: (model) =>
            profileImage = new Image
            profileImage.src = model.get('target').image_medium.url

            badgeImage = new Image
            badgeImage.src = model.get('object').image_medium.url

            max = 2
            comments = model.get('comments')

            comments =  if (comments.length > max) then comments.slice(comments.length - max, comments.length) else comments
            $.each comments, (index, value) =>
                profilePic = new Image
                profilePic.src = value.creator.profile_img

        renderRecognitions: ->
            ###
            This will render all the recognitions. The code here is separate
            from the main 
            ###

            $ =>
                @$el.css
                    opacity: 0

                @recognitionsCollection.forEach (model) =>
                    recognitionView = new RecognitionView
                        model: model

                    recognitionView.render()
                    @$el.append recognitionView.el

                
                @$el.masonry
                    itemSelector: '.recognition-view'


                @$el.transition
                    opacity: 1
                , 1000
                , =>
                    @$el.find('.recognition-view').addClass('animate');