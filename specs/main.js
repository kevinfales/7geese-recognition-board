requirejs.config({
    shim: {
        'app/jquery/jquery.masonry.min.js': ['jquery'],
        'app/jquery/jquery.serializeobject.js': ['jquery'],
        'app/jquery/jquery.transit.min.js': ['jquery']
    }
});

require([
    'cs!specs/LoginSpec'
], function () {});
