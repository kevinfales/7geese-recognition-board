define 'app/collections/RecognitionsCollection', [
    'backbone'
], ->
    Backbone = require 'backbone'
    $ = require 'jquery'

    return class RecognitionsCollection extends Backbone.Collection
        load: ->
            deferred = $.getJSON "https://"

            return deferred