function draw(type, container, header, rows, opt) {
	switch(type) {
		case "PIE":
			drawPie(container, header, rows, opt);
			break;
		case "BAR":
			drawBars(container, header, rows, opt);
			break;
		case "COLUMN":		
			drawBars(container, header, rows, opt);
			break;
		case "TREE":
			drawMenu(container, header, rows, opt);
			break;
		case "DONUT":
			drawDonuts(container, header, rows, opt);
			break;
	}
}

function drawTooltip(where) {
	if (where == undefined) {
		where = d3.select("body");
	}
	where.append("div").attr("id", "chart-tooltip").style("opacity", 0);
}

function drawDonuts(container, header, rows, opt) {
	var dataRetrieved = '{"name":"Module name","data":[{"label":"Completed","value":"12"},{"label":"In Progress","value":"5"},{"label":"Not Started","value":"2"}]}';
	var data = eval('(' + dataRetrieved + ')');

	var width = 85, height = 85, radius = Math.min(width, height) / 2, margin = 36;
	var posX = 0, index = 0, total = 0;

	data.data.forEach(function(d) {
		total += parseInt(d["value"]);
	});

	var pie = d3.layout.pie().value(function(d) {
		return parseInt(d);
	}).sort(null);

	var arc = d3.svg.arc().innerRadius(radius - 15).outerRadius(radius);

	$('#' + container + ' #data-loading-msg').remove();

	var chart = d3.select(document.getElementById(container)).append("div").attr("class", "donuts-chart");
	//var mainSvg = chart.append("svg");

	data.data.forEach(function(d) {
		createChart(d);
	});

	function getColor(d, i) {
		var firstColors = ["#00AEEF", "#E6E6E6"];
		var secondColors = ["#BE0074", "#E6E6E6"];
		var thirdColors = ["#FFD800", "#E6E6E6"];
		var allColors = [firstColors, secondColors, thirdColors];

		return allColors[d][i];
	}

	function createChart(d) {

		console.log("value " + d["value"]);
		posX += margin;

		var svg = chart.append("svg").attr("width", width).attr("height", height).style("margin", "20px").append("g").attr("x", posX).attr("transform", "translate(" + width / 2 + "," + height / 2 + ")");
		var diff = parseInt(total) - parseInt(d["value"]);
		console.log("dif is " + diff);

		var values = new Array();

		values.push(d["value"]);
		values.push(diff);

		var path = svg.datum(values).selectAll("path").data(pie).enter().append("path").attr("fill", function(d, i) {
			return getColor(index, i);
		}).attr("d", arc).each(function(d) {
			this._current = parseInt(d);
		});

		var percent = Math.floor(parseInt(parseInt(values[0]) * 100) / parseInt(total));

		var circle = svg.append("svg:circle").attr("fill", function() {
			return getColor(index, 0);
		}).attr("x", posX + 20).attr("y", 20).attr("r", 20);
		var circleText = svg.append("text").attr("x", posX).attr("y").attr("text-anchor", "middle").text(percent);

		var label = chart.append("svg:text").text(function() {
			return d["label"];
		}).attr("x", posX).attr("y", 100);

		//path.transition().duration(750).attrTween("d", arcTween);

		index++;
		posX += margin * 2 + width;
	}

	// store the initial angles
	function arcTween(a) {
		var i = d3.interpolate(this._current, a);
		this._current = i(0);
		return function(t) {
			return arc(i(t));
		};
	}

}

function drawBars(container, header, rows, opt) {
	console.log("Drawing Bars");
	var dataRetrieved = '[{"rows":[{"group":"Group","moduleList":[{"name":"111111111Torts - Strict Liability; Nuisance","difficulty":"VERY EASY","questions":"5","AT":"00:01:12","RT":"00:01:01","total":"19","completed":"10","inProgress":"1","notStarted":"8"},{"name":"Torts - Strict Liability; Nuisance","difficulty":"VERY EASY","questions":"5","AT":"00:01:12","RT":"00:01:01","total":"19","completed":"5","inProgress":"1","notStarted":"8"},{"name":"Torts - Strict Liability; Nuisance","difficulty":"VERY EASY","questions":"5","AT":"00:01:12","RT":"00:01:01","total":"19","completed":"10","inProgress":"1","notStarted":"8"}]},{"group":"Group","moduleList":[{"name":"Torts - Strict Liability; Nuisance","difficulty":"VERY EASY","questions":"5","AT":"00:01:12","RT":"00:01:01","total":"19","completed":"10","inProgress":"1","notStarted":"8"},{"name":"Torts - Strict Liability; Nuisance","difficulty":"VERY EASY","questions":"5","AT":"00:01:12","RT":"00:01:01","total":"19","completed":"10","inProgress":"1","notStarted":"8"},{"name":"Torts - Strict Liability; Nuisance","difficulty":"VERY EASY","questions":"5","AT":"00:01:12","RT":"00:01:01","total":"19","completed":"10","inProgress":"1","notStarted":"8"}]}]}]';
	var states = ["completed", "inProgress", "notStarted"];

	rows = eval('(' + dataRetrieved + ')');

	var barWidth = 17, chartHeight = 10, barsDistance = 10, groupDistance = 87, maxHeight = 295;
	var posX = 30;

	$('#' + container + ' #data-loading-msg').remove();

	var top = d3.select(document.getElementById(container)).style("height", "300px").append("div").attr("class", "bars-chart-top");
	var searchField = top.append("input").attr("type", "search").on("keyup", searchModule);

	function searchModule() {
		var element = d3.select("[name='" + searchField.property("value") + "']");
		if (element) {
			console.log("goto " + element.attr("x"));
		}
	}

	var chart = d3.select(document.getElementById(container)).append("div").attr("class", "bars-chart");
	var mainSvg = chart.append("svg").style("height", "400px");
	var initialData = rows[0].rows;

	var maxValue = getMaxValue();

	createAxis();
	createBars();

	function createAxis() {
		var width = 500, p = [20, 50, 30, 20];
		var y = d3.scale.linear().rangeRound([maxHeight, 0]);
		var yAxis = d3.svg.axis().scale(y).orient("left").tickFormat(d3.format(".2s"));
		y.domain([0, maxValue]);

		mainSvg.append("g").attr("class", "y axis").call(yAxis).append("text").attr("transform", "rotate(-90)").attr("y", 0).attr("x", -maxHeight / 2).attr("dy", ".71em").style("text-anchor", "middle").text("Students");

		// Add y-axis rules.
		var rule = mainSvg.selectAll("g.rule").data(y.ticks(5)).enter().append("svg:g").attr("class", "rule").attr("transform", function(d) {
			return "translate(" + posX + "," + (y(d) + 1) + ")";
		});

		rule.append("svg:line").attr("x2", width - p[1] - p[3]).style("stroke", function(d) {
			return d ? "#EBEBEB" : "#D9D9D9";
		}).style("stroke-opacity", function(d) {
			return d ? .7 : null;
		});

		rule.append("svg:text").attr("x", -15).attr("dy", ".15em").text(d3.format(",d"));
	}

	function getMaxValue() {
		var currentMaxValue = 0;
		initialData.forEach(function(d) {
			d.moduleList.forEach(function(d) {
				if (currentMaxValue < d["total"]) {
					currentMaxValue = d["total"];
				}
			});
		});
		return currentMaxValue;
	}

	function createBars() {

		var moduleList;

		mainSvg.selectAll("svg").data(initialData).enter().append("svg").attr("y", function(d) {
			var chartX = posX, chartHeight = 0, chartWidth = 0, chartY, svg = d3.select(this);
			var initialX = posX;

			moduleList = d.moduleList;

			svg.selectAll("g").data(moduleList).enter().append("g").attr("name", function(d) {
				return d.name;
			}).attr("x", function(d) {
				var barX = posX;
				posX += barWidth + barsDistance;
				chartWidth += barWidth + barsDistance;
				var barY = 0;
				var bar = d3.select(this);
				chartHeight = 0;
				states.forEach(function(d, i) {
					var height;
					bar.append("rect").attr("height", function(d) {
						height = maxHeight * parseInt(d[states[i]]) / maxValue;
						return height;
					}).style("fill", selectColor(states[i])).attr("width", barWidth).attr("y", function() {
						var posY = barY;
						barY += parseInt(height);
						chartHeight += parseInt(height);
						return posY;
					});
				});

				var diff = parseInt(maxHeight) - parseInt(chartHeight);
				chartY = diff;
				bar.attr("transform", "translate(" + barX + "," + chartY + ")").attr("y", chartY);

				return barX;
			}).attr("width", barWidth).on("mouseover", showTooltip).on("mouseout", hideTooltip);
			posX += groupDistance;

			svg.append("svg:text").attr("x", function(d) {
				return (chartWidth / 2) + initialX - barWidth / 2;
			}).attr("y", maxHeight + 15).attr("text-anchor", "middle").attr("dy", ".50em").text(function() {
				return d.group;
			});

			return 0;
		});

		function selectColor(type) {
			var barColor;
			switch(type) {
				case "completed":
					barColor = "#00AEEF";
					break;
				case "inProgress":
					barColor = "#BE0074";
					break;
				case "notStarted":
					barColor = "#FFD800";
					break;
			}

			return barColor;
		}

	}

	function showTooltip(d, e) {
		drawTooltip(chart);
		var module = d3.select(this);
		var tooltip = d3.select(document.getElementById("chart-tooltip"));

		var content = tooltip.append("div").style("class", "chart-tooltip-content");
		content.append("h1").text(d.name);
		content.append("div").text(d.total + " students. " + d.questions + " questions");

		tooltip.style("display", "block").style("left", function() {
			return parseInt(module.attr("x")) - parseInt(tooltip.style("width").replace("px", "")) / 2 + module.attr("width") / 2 + "px";
		}).style("top", function() {
			return 40 + parseInt(module.attr("y")) - parseInt(tooltip.style("height").replace("px", "")) / 2 + "px";
		}).transition().duration(200).style("opacity", 1);
	}

	function hideTooltip(d) {
		var tooltip = d3.select(document.getElementById("chart-tooltip")).style("opacity", 0).remove();
	}

	//this.drawTooltip(chart);

}

function drawMenu(container, header, rows, opt) {
	//var dataRetrieved = '[{"name" : "curriculum","children" : [ {"name" : "Group","children" : [ {"name" : "Torts - Strict Liability; Nuisance"}, {"name" : "Torts - Vicarious Liability and Joint Liability"}, {"name" : "Torts - Products Liability"}, {"name" : "Torts - Negligence: Breach and Causation"}, {"name" : "Torts - Negligence: Duty of Care"}]}, {"name" : "Group 2","children" : [ {"name" : "Torts - Defamation, Privacy, Economic Torts"}, {"name" : "Torts - Wrongful Death, Tort Immunities"}, {"name" : "Torts - Intentional Torts"}]}, {"name" : "Group 3","children" : [ {"name" : "Torts - Negligence: Damages and Defenses"}]}]}]';
	//rows = eval('(' + dataRetrieved + ')');
	var data = rows;
	var nodeClicked = false;

	var duration = 500, height = 25;

	$('#' + container + ' #data-loading-msg').remove();

	d3.select(document.getElementById(container)).select("div").remove();

	var div = d3.select(document.getElementById(container)).append('div').attr('id', 'menu-chart').append('div').attr('id', 'menu-inner');
	;

	var initialData = data[0];
	div.data(initialData, function(d) {
		var menuData = initialData.children;

		div.selectAll("ul").data(menuData).enter().append("ul").on("click", expand).append("div").append("h3").text(function(d) {
			return d.name;
		});

	});

	function expand(d) {
		var subData = d.children;
		d3.select(this).select("h3").attr("class", "opened");
		var submenu = d3.select(this).on("click", collapse);

		submenu.data(d, function(d) {
			submenu.selectAll("li").data(subData).enter().append("li").text(function(d) {

				d3.select(this).on("click", nodeClick).style("opacity", 0).transition().duration(duration).style("opacity", 1);

				return d.name;
			});
		});
	}

	function collapse(d) {
		if (!nodeClicked) {
			d3.select(this).select("h3").attr("class", null);
			d3.select(this).on("click", expand).selectAll("li").transition().duration(duration).style("opacity", 0).remove();
		} else {
			nodeClicked = false;
		}
	}

	function nodeClick(d) {
		nodeClicked = true;
		console.log("Node clicked: " + d.name);
	}

	function expandAll() {
		$("ul").click();
	}

	expandAll();
	$("#menu-inner").jScrollPane({showArrows: true});

}

function drawPie(container, header, rows, opt) {
	var data = google.visualization.arrayToDataTable(prepareData(header, rows));

	var options = {};
	_.extend(options, opt);

	var chart = new google.visualization.PieChart(document.getElementById(container));
	chart.draw(data, options);
}

