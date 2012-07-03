define ['jquery', 'cs!app/views/MainView'], ->
    MainView = require 'cs!app/views/MainView'
    $ = require 'jquery'

    return {
        init: ->
            $ ->
                view = new MainView
                view.render()
                $('body').append view.el
    }
