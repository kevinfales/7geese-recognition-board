requirejs.config({
    shim: {
        'app/jquery/jquery.masonry.min.js': ['jquery']
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
