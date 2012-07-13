define [
    'backbone'

    'app/bin/settings'

    'app/lib/backbone-tastypie'

    'cs!app/models/RecognitionModel'
], ->

    Backbone = require 'backbone'
    $ = require 'jquery'

    RecognitionModel = require 'cs!app/models/RecognitionModel'

    settings = require 'app/bin/settings'

    return class RecognitionsCollection extends Backbone.Collection
        model: RecognitionModel
        defaultGetParams:
            dataType: 'jsonp'
            data:
                verb: 'badge_awarded'
        url: "#{settings.hostname}/api/v1/stream/"
        fetch: (options={}) =>
            options = $.extend true, @defaultGetParams, options
            debugger
            super options