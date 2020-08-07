/*
 * Backbone View object to handle opened clients
 */
define(['config', 'view/clientView', 'model/client'], function(Config, ClientView) {
	Config.setUp();

	var DashboardView = Backbone.View.extend({
		template : $("#DashboardTemplate").html(),
		className : "dashboard-container",
		widgets : null,
		wCount : 0,

		initialize : function(props) {
			this.widgets = props.widgets;
			this.home = props.home;
			this.render();
		},
		render : function() {
			var self = this;
			var json = this.model.toJSON();
			json.widgets = this.widgets;

			this.$el.html(_.template(this.template, json));
			this.$("#Container_" + this.model.get("id")).css('position', 'relative');

			return this;
		},

		addDashboardWidgets : function() {
			var self = this;
			var widgetsToPlace = this.model.get("dashboardWidgets");
			for (var i = 0; i < widgetsToPlace.length; i++) {
				var model = widgetsToPlace[i].result;
				model.x = widgetsToPlace[i].x;
				model.y = widgetsToPlace[i].y;

				// place the widget on the dashboard
				self.placeWidget(model, widgetsToPlace[i].result.id);

				// Re-set the dashboardWidget object to be send at 'Save' action
				var dashboardWidget = new DashboardWidget({
					widget : {
						id : widgetsToPlace[i].result.id
					},
					x : model.x,
					y : model.y,
					h : model.h,
					w : model.w
				});
				widgetsToPlace[i] = dashboardWidget;
			}
		},

		events : {
			'click #dashboardAddWidget' : 'openAddWidget',
			'click .confirmAddWidget' : 'addWidget',
			'click #dashboardSave' : 'saveDashboard',
			'click #dashboardDefault' : 'openSetAsDefault',
			'click .confirmSetDefault' : 'setAsdefault',
			'click #btnCloseDashboard' : 'closeDashboardTab'
		},

		openSetAsDefault : function() {
			$("#ConfirmDefault").modal("show");
		},

		setAsdefault : function(evt) {
			console.log("click");
			$("#ConfirmDefault").modal("hide");
			this.model.set("loadedByDefault", "true");
			this.saveDashboard();
		},

		saveDashboard : function() {
			console.log("Saving dashboard");
			var self = this;

			var i = 0;
			d3.selectAll('.dashboard-widget').each(function() {
				// get widget model from widget element
				var widget = d3.select(this);
				var json = self.model.toJSON();

				console.log("i " + i);

				var currentModel = json.dashboardWidgets[i];

				if (currentModel != undefined) {
					var dashboardWidget = new DashboardWidget({
						widget : {
							id : (currentModel.get("widget").id).toString()
						},
						x : widget.style("left").replace("px", ""),
						y : widget.style("top").replace("px", ""),
						h : widget.style("height").replace("px", ""),
						w : widget.style("width").replace("px", "")
					});

					json.dashboardWidgets[i] = dashboardWidget;
				}
				i++;
			});

			$.ajax({
				type : "POST",
				contentType : 'application/json; charset=utf-8',
				url : "rest/dashboard/save",
				data : JSON.stringify(this.model),
				dataType : "json"
			}).done(function() {
				$("#DashboardSaved").modal("show");
			});
		},

		storeWidget : function(widgetModel) {
			var dashboardWidget = new DashboardWidget({
				widget : {
					id : widgetModel.id
				},
				x : widgetModel.x,
				y : widgetModel.y,
				h : widgetModel.h,
				w : widgetModel.w
			});

			var json = this.model.toJSON();
			json.dashboardWidgets[json.dashboardWidgets.length] = dashboardWidget;
			this.model.set("dashboardWidgets", json.dashboardWidgets);
		},

		removeWidget : function(widgetId) {

			console.log("Deleting widget " + widgetId);

			var json = this.model.toJSON();

			var newDashboards = new Array();

			console.log("length " + json.dashboardWidgets.length);

			//TODO: change the id for the real widget id because this doesn't work when there are 2 widgets with same id
			for (var i = 0; i < json.dashboardWidgets.length; i++) {
				var current = json.dashboardWidgets[i];
				console.log("currentId " + current.get("widget").id);
				if (current.get("widget").id != widgetId) {
					console.log("adding");
					newDashboards.push(current);
				}
			}

			this.model.set("dashboardWidgets", newDashboards);

		},

		closeDashboardTab : function() {
			console.log('closing dashboard tab.');
			this.home.unselectDashboard(this.model.get('id'));
			// Be careful when removing an element, make sure it is the one we want to remove.
			var tabId = "dtab" + this.model.get('id');
			// FIX ME: get the id, not the name
			$('#' + tabId).remove();
			$('a[href="#' + tabId + '"]').remove();
			$('#tabHeaders a:first').tab('show');
			// After removing the current tab it will return to Home.
			//enable the load button
			//$('#Load_' + tabId).removeAttr("disabled");
		},

		openAddWidget : function(evt) {
			$("#WidgetsRepository_" + this.model.get("id")).modal("show");
		},

		placeWidget : function(model, wId) {
			this.wCount++;
			var self = this;
			model.dashboardId = self.model.get("id");
			model.id = wId;
			model.count = self.wCount;
			var widgetView = new WidgetView({
				model : model,
				dashboard : self
			});
			self.$("#Container_" + self.model.get("id")).append(widgetView.el);
			widgetView.draw();
		},

		addWidget : function(evt) {
			var self = this;
			var wId = this.$("#widgetsTabs_" + this.model.get("id") + " li.active").data("wid");
			if (wId !== null) {
				$.ajax({
					type : "POST",
					contentType : 'application/json; charset=utf-8',
					url : "./rest/widget/add",
					data : JSON.stringify({
						widgetId : wId
					}),
					dataType : "json"
				}).done(function(model, result) {
					self.placeWidget(model, wId);
					self.storeWidget(model);
				});
				$("#WidgetsRepository_" + self.model.get("id")).modal("hide");
			} else {
				alert("No widget selected");
			}
		},

		setDragAndDrop : function(active) {
			// activate draggable plugin for all widgets
			var self = this;
			if (active) {
				this.dragAndDrop = this.$('.dashboard-widget').draggable({
					tolerance : 'pointer',
					//opacity: 0.7,
					containment : this.el,
					cursor : 'pointer',
					handle : '.dashboard-widget-header',
					// controls z-index automatically
					stack : '.dashboard-widget',
					// ommit default classes
					addClasses : false
				});
				// listen for drag stop
				this.$('.dashboard-widget').on('dragstop', this, function(event, ui) {
					// get widget model from widget element
					var widgetModel = event.data.model.get('widgets').get($(ui.helper).attr('data-id'));
					// update model x & y (pass 'silent: true' to avoid triggering change event)
					widgetModel.set({
						'x' : ui.position.left,
						'y' : ui.position.top
					}, {
						silent : true
					});
				});
				// de-activate sortable
			} else {
				// check for previous initialization
				if (this.dragAndDrop) {
					// destroy plugin
					this.dragAndDrop.draggable('destroy');
				}
			}
		}
	});

	return DashboardView;

});
