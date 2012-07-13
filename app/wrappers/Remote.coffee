define [
    'app/bin/settings'
], ->
    settings = require 'app/bin/settings'

    return class Remote
        checkAuth: (username, apiToken) ->
            creds = {}
            if username.length and apiToken.length
                creds.username = username
                creds.api_key = apiToken
            query = "#{settings.hostname}/api/v1/user/?limit=1&format=jsonp&callback=?&#{$.param creds}"
            return $.getJSON query          
        getJSON: (username, apiToken) ->
            query = "#{settings.hostname}/api/v1/stream/?verb=badge_awarded&username=#{username}&api_key=#{apiToken}&format=jsonp&callback=?"

            return $.getJSON query
