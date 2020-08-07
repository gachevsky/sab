/*
 * This is the main JavaScript file, the Application's functions are here.
 * 
 * IMPORTANT: we should NOT use this place to put specific look and feel. When doing a customization
 * for a client, please use another js file.
 */
define([
    'config',
    'view/clientListView',    
    
], function(Config, ClientListView){
    
    var clientsMain;
    
	var initialize = function() {
		clientsMain = new ClientListView();
		$("#acuitasMain").html(clientsMain.el);
		
		console.log("Gamasoft loaded.");
	};
	    
    return {
    	initialize: initialize,
    };
});