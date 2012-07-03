requirejs.config({
    shim: {
        'js/jquery/jquery.isotope.min.js': [ 'jquery' ]
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
