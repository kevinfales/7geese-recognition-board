define [
    'backbone'

    'cs!app/models/RecognitionModel'
], ->

    Backbone = require 'backbone'
    $ = require 'jquery'

    RecognitionModel = require 'cs!app/models/RecognitionModel'

    return class RecognitionsCollection extends Backbone.Collection
        model: RecognitionModel