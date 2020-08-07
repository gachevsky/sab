/*
 * Backbone Collection object to handle clients
 */
define([
    'model/client'
], function(Client) {
    var Clients = Backbone.Collection.extend({
        
        model: Client,
        initialize: function(props) {
            this.url = "./rest/client/";
            this.urlRoot = "./rest/client/";
        }
    });

    return Clients;

});



