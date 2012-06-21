define 'app/app', ['jquery', 'cs!app/views/MainView'], ->
    MainView = require 'app/views/MainView'
    $ = require 'jquery'

    return {
        init: ->
            mainView = new MainView
            mainView.render()

            $('body').html mainView.el
    }
