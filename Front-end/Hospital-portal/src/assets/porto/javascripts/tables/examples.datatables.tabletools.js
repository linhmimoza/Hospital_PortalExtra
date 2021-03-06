/*
Name: 			Tables / Advanced - Examples
Written by: 	Okler Themes - (http://www.okler.net)
Theme Version: 	1.5.2
*/

(function($) {

	'use strict';

	var datatableInit = function() {
		var $table = $('#datatable-tabletools');
		var $table2 = $('#datatable-tabletools2');
		var $table4 = $('#datatable-tabletools4');
		$table.dataTable({
			sDom: "<'text-right mb-md'T>" + $.fn.dataTable.defaults.sDom,
			oTableTools: {
				sSwfPath: $table.data('swf-path'),
				aButtons: [
				
					{
						sExtends: 'print',
						sButtonText: 'Full screen',
						sInfo: 'Please press CTR+P to print or ESC to quit'
					}
				]
			}
		});
		$table2.dataTable({
			sDom: "<'text-right mb-md'T>" + $.fn.dataTable.defaults.sDom,
			oTableTools: {
				sSwfPath: $table2.data('swf-path'),
				aButtons: [

					{
						sExtends: 'print',
						sButtonText: 'Full screen',
						sInfo: 'Please press CTR+P to print or ESC to quit'
					}
				]
			}
		});
		$table4.dataTable({
			sDom: "<'text-right mb-md'T>" + $.fn.dataTable.defaults.sDom,
			oTableTools: {
				sSwfPath: $table4.data('swf-path'),
				aButtons: [

					{
						sExtends: 'print',
						sButtonText: 'Full screen',
						sInfo: 'Please press CTR+P to print or ESC to quit'
					}
				]
			}
		});
	};
	

	$(function() {
		datatableInit();
	});

}).apply(this, [jQuery]);
