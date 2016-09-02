/*jslint vars: true, undef: true, browser: true, plusplus: true  */
/*global jQuery, $, Modernizr, Placeholder, window, Lectric, helpers, methods */

$(document).ready(function () {
	function makeExpandingArea(container) {
		if (window.opera && /Mac OS X/.test(navigator.appVersion)) {
			container.querySelector('pre').appendChild(document.createElement('br'));
		}

		var area = container.querySelector('textarea');
		var span = container.querySelector('span');
		if (area.addEventListener) {
			area.addEventListener('input', function () {
				span.textContent = area.value;
			}, false);
			span.textContent = area.value;
		} else if (area.attachEvent) {
			// IE8 compatibility
			area.attachEvent('onpropertychange', function () {
				span.innerText = area.value;
			});
			span.innerText = area.value;
		}
		// Enable extra CSS
		container.className += ' active';
	}

	if (navigator.appVersion.indexOf("MSIE 7.") === -1 && navigator.appVersion.indexOf("MSIE 6.") === -1) {
		var areas = document.querySelectorAll('.expandingArea');
		var l = areas.length;

		while (l--) {
			makeExpandingArea(areas[l]);
		}
	}

	$("#variable_add input[name=variable_name]").keyup(function (e) {
		var currentElement = $("#variable_add input[name=variable_name]");
		var allowed = /[^a-zA-Z0-9_-]/;
		var match = currentElement.val().match(allowed);
		if (match) {
			currentElement.val(currentElement.val().replace(match[0], ''));
		}

		$("#variable_add .variable_name").html(currentElement.val());
	});

	$("input[name='use_language']").change(function () {

		var inputValue = $(this).val();
		if (inputValue === 'y') {
			$("#language_table").show();
			$("#default_value_row.hidden").hide();
		} else {
			$("#language_table").hide();
			$("#default_value_row").show();
		}
	});

	// Fix odd/even classes for the rows (take hidden rows into account)
	$("#variable_add").find('tbody tr:not(":hidden")').each(function (index) {
		$(this).removeClass('odd').removeClass('even');
		$(this).addClass(index % 2 === 0 ? 'odd' : 'even');
	});

});
