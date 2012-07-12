define [
    'app/bin/settings'
], ->
    settings = require 'app/bin/settings'

    return class Remote
        getJSON: (username, apiToken) ->
            query = "#{settings.hostname}/api/v1/stream/?verb=badge_awarded&username=#{username}&api_key=#{apiToken}&format=jsonp&callback=?"

            return $.getJSON query
