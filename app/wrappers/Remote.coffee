define [
    'cs!app/statics'
], ->
    statics = require 'cs!app/statics'

    return class Remote
        getJSON: (username, apiToken) ->
            query = "#{statics.hostname}/api/v1/stream/?verb=badge_awarded&username=#{username}&api_key=#{apiToken}&format=jsonp&callback=?"

            return $.getJSON query