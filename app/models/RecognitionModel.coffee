define ['backbone', 'app/lib/backbone-tastypie'], ->
    Backbone = require 'backbone'

    return class RecognitionModel extends Backbone.Model
    	idAttribute: "id"