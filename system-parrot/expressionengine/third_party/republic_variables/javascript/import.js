/*jslint vars: true, undef: true, browser: true, plusplus: true */
/*global jQuery, $, Modernizr, Placeholder, window, Lectric, helpers, methods */

$(document).ready(function () {
	$("table th input").change(function () {
		var tbodyInputs = $(this).closest('table').find('tbody').find('input');
		if ($(this).is(":checked")) {
			tbodyInputs.attr('checked', 'checked');
		} else {
			tbodyInputs.attr('checked', false);
		}
	});
});
