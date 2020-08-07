/*
 * A Dashboard Backbone model.
 */

define(['config'], function(Config) {

	var Client = Backbone.Model.extend({
		defaults : {
			id : null,
			name : null,
			description : null, 
			address : null, 
			nit : null,
			contactName : null, 
			phone : null
		},
		urlRoot : './rest/client/'
	});

    return Client;

});
