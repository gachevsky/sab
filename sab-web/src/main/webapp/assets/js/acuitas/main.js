/**
 * 
 * Main script to load and configure the modules
 * Initialize the App
 * Overrides the underscore template markup to avoid the collide with JSP markup
 */

requirejs.config({
    baseUrl: 'assets/js/acuitas',
    /*
    paths: {
        jquery: '../libs/jquery-1.8.2.min',
        jqueryui: '../libs/jquery-ui-1.9.1.custom.min',
        bootstrap: '../libs/bootstrap.min',
        bootstrapSelect: '../libs/bootstrap-select.min',
        underscore: '../libs/underscore-1.4.4-min',
        backbone: '../libs/backbone-1.0.0-min',
        livevalidation: '../libs/livevalidation.compressed',
        highcharts: '../libs/highcharts-2.3.5-exporting',
        highchartsCore: '../libs/highcharts-2.3.5',
        confirmbox: '../libs/bootstrap-confirm',
        cryptojs: '../libs/cryptojs-3.1.2-sha512'
    },
    
    shim: {
    	jquery: {
    		exports: '$'
    	},
        underscore: {
            exports: '_'
        },
        backbone: {
            deps: ['underscore', 'jquery'],
            exports: 'Backbone'
        },
        highchartsCore: {
            deps: ['jquery'],
            exports: 'HighchartsCore'
        },
        highcharts: {
        	deps: ['highchartsCore'],
        	exports: 'Highcharts'
        },
        bootstrap: {
        	deps: ['jquery'],
        	// Add here the jQuery plugins provided by Bootstrap
        	exports: '$.fn.dropdown'
        },
        bootstrapSelect: {
            deps: ['jquery', 'bootstrap'],
            exports: '$.fn.selectpicker'
        },
        'jqueryui.draggable': {
        	deps: ['jquery'],
        	exports: '$.fn.draggable'
        },
        'jqueryui.datepicker': {
        	deps: ['jquery'],
        	exports: '$.fn.datepicker'
        },
        confirmbox: {
        	deps: ['jquery'],
        	exports: '$.fn.confirmModal'
        },
        cryptojs: {
        	exports: 'CryptoJS'
        }
        
    },*/
    shim: {
        '../libs/underscore-min': {
        exports: '_'
	},
	'../libs/backbone-min': {
		deps: ['../libs/underscore-min'],
		exports: 'Backbone'
	},
	'app': {
		deps: [	'../libs/underscore-min',
				'../libs/backbone-min']
	}
  },
    urlArgs: "bust=" +  (new Date()).getTime()

});

// Load and initialize Acuitas JS


requirejs(['acuitas'],
function(Acuitas){
	Acuitas.initialize();
});


