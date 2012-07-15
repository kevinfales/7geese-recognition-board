requirejs.config({
    shim: {
        'app/jquery/jquery.masonry.min.js': ['jquery'],
        'app/jquery/jquery.transit.min.js': ['jquery'],
        'app/jquery/jquery.serializeobject.js': ['jquery'],
        'app/jquery/jquery.jsonp.js': ['jquery'],
        'app/lib/backbone-tastypie.js': ['backbone']
    }
});

define(['cs!app/app'], function () {
    var app = require('cs!app/app');
    return {
        init: function () {
            app.init();
        }
    }
});
