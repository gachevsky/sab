define(['config', 'collection/clients', 'model/client', 'view/clientView'], function(Config, Clients, Client, ClientView) {
	Config.setUp();
	
	var listView = null;
	var selectedClients = new Array();

	var ClientListView = Backbone.View.extend({
		template : $('#mainClientsView-Template').html(),
		initialize : function() {
			var self = this;
			this.collection = new Clients();
			this.collection.fetch({
				success : function(model, result) {
					self.render();
				},
				error : function(model, result) {
					console.log(model);
					console.log(result);
				}
			});
		},
		
		render : function() {
			var self = this;
			self.$el.html(_.template(this.template, {}));
			self.$("#ClientsListContainer").html(_.template($("#clientsListView-Template").html(), {
				clients : self.collection.models,
				home : self
			}));
		},
		unbind : function() {

		},
		events : {
			'click #btnCreateClient' : 'createClient',
			'click #btnCancelClient' : 'cancelClientForm',
			'click .btnLoad' : 'loadClient',
			'click .btnDelete' : 'deleteClient'
		},
		
		cancelClientForm : function(evt) {
			console.log("cancel client creation ... ");
			
		},
		
		createClient : function(evt) {
			var self = this;
			console.log("creating client... ");
			if ($("#ClientName").val() === "") {
				alert("Name is required");
			}else{
			    var c = new Client({
					name : $("#ClientName").val(),
					description : $("#ClientDescription").val(),
					address : $("#Address").val(),
					nit : $("#Nit").val(),
					contactName : $("#ContactName").val(),
					phone : $("#Phone").val()
				});
				c.save({}, {
					success : function(model, response, options) {
						self.collection.fetch({
							success : function(model, result) {
								$("#createClientModal").modal("hide");
								self.$("#ClientListContainer").html(_.template($("#clientsListView-Template").html(), {
									clients : self.collection.models,
									home : self
								}));
							},
							error : function(model, result) {
								console.log(model);
								console.log(result);
							}
						});
					},
					error : function(model, xhr, options) {
						console.log(model);
						console.log(xhr);
						console.log(options);
					}
				});
			}
		},
		
		loadClient : function(evt) {
			var self = this;
			console.log("loading client... ");
			
		},		
		
		deleteClient : function(evt) {
			var self = this;
		}
	});

	return ClientListView;
});
