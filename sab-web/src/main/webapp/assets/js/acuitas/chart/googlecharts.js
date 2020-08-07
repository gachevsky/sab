function draw(type, container, header, rows, opt){
    switch(type){
        case "PIE": drawPie(container, header, rows, opt); break;
        case "BAR": drawBar(container, header, rows, opt); break;
        case "COLUMN": drawColumn(container, header, rows, opt); break;
    }
}

function drawPie(container, header, rows, opt){
    var data = google.visualization.arrayToDataTable(
        prepareData(header,rows)
    );
        
    var options = {};
    _.extend(options,opt);
    
    var chart = new google.visualization.PieChart(document.getElementById(container));
    chart.draw(data, options);
}

function drawBar(container, header, rows, opt){
    var data = google.visualization.arrayToDataTable(
        prepareData(header,rows)
    );

    var options = {};
    _.extend(options,opt);
    
    var chart = new google.visualization.BarChart(document.getElementById(container));
    chart.draw(data, options);
}

function drawColumn(container, header, rows, opt){
    var data = google.visualization.arrayToDataTable(
        prepareData(header,rows)
    );

    var options = {};
    _.extend(options,opt);
    
    var chart = new google.visualization.ColumnChart(document.getElementById(container));
    chart.draw(data, options);
}

function prepareData(header,data){
    var table=[];
    var headRow=[];
    _.each(header,function(head){
        headRow.push(head);
    });
    table.push(headRow);
    _.each(data,function(row){
        var dataRow=[];
        _.each(header,function(head){
            dataRow.push(row[head]);
        });
        table.push(dataRow);
    });
    return table;
}