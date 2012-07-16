define [
    'app/bin/settings'
    'app/jquery/jquery.jsonp.js'
], ->
    settings = require 'app/bin/settings'

    return class Remote
        checkAuth: (username, apiToken) ->
            creds = {}
            query = "#{settings.hostname}/api/v1/user/?callback=callback&limit=1"
            if username.length and apiToken.length
                creds.username = username
                creds.api_key = apiToken
                query = query + "&#{$.param creds}"
            return $.jsonp {url: query, dataType: 'jsonp', callback: 'callback'}         
        getJSON: (username, apiToken) ->
            query = "#{settings.hostname}/api/v1/stream/?verb=badge_awarded&username=#{username}&api_key=#{apiToken}&format=jsonp&callback=?"

            return $.getJSON query
