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
                limit: 20

        fetch: (options={}) =>
            mergedOptions = _.clone @defaultGetParams
            mergedOptions = $.extend true, mergedOptions, options
            super mergedOptions

        url: =>
            url = "#{settings.hostname}/api/v1/stream/"
            if Backbone.Tastypie.apiKey and Backbone.Tastypie.apiKey.username.length and Backbone.Tastypie.apiKey.key.length
                creds = {username: Backbone.Tastypie.apiKey.username, api_key: Backbone.Tastypie.apiKey.key}
                url = "#{url}?#{$.param creds}"
            url
