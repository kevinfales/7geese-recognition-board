define(['lessc!less/style.less', 'cs!app/app'], function () {
    var app = require('cs!app/app');
    return {
        init: function () {
            app.init();
        }
    }
});
