// Tooltips
$(function () {
  //$('[data-toggle="tooltip"]').tooltip();
  //$('[data-toggle="popover"]').popover();
});

$(document).ready(function() {

	// Show other country
	$('#country_can, #country_emp').change(function() {
		if ( $(this).val() === 'Other' ) {
			$('.otherCountry').show();
		} else{
			$('.otherCountry').hide();
		}
	});	

	function redirect(location, time) {
		setTimeout("location.href = 'location';", time);
	}

	// hover on dashboard elements
	$('#dashboard_wrap div section > div div a').hover(
        function () {
           $(this).parent().css({"box-shadow":"0px 2px 5px 0px rgba(0, 0, 0, 0.17)"});
        }, 
        function () {
           $(this).parent().css({"box-shadow":"0px 0px 0px 0px rgba(0, 0, 0, 0.0)"});
        }
    );

    //Tabs CV Update

	$('ul.tabs').each(function(){
		// For each set of tabs, we want to keep track of
		// which tab is active and it's associated content
		var $active, $content, $links = $(this).find('a');

		// If the location.hash matches one of the links, use that as the active tab.
		// If no match is found, use the first link as the initial active tab.
		$active = $($links.filter('[href="'+location.hash+'"]')[0] || $links[0]);
		$active.addClass('active');

		$content = $($active[0].hash);

		// Hide the remaining content
		$links.not($active).each(function () {
			$(this.hash).hide();
		});

		// Bind the click event handler
		$(this).on('click', 'a', function(e){
			// Make the old tab inactive.
			$active.removeClass('active');
			$content.hide();

			// Update the variables with the new link and content
			$active = $(this);
			$content = $(this.hash);

			// Make the tab active.
			$active.addClass('active');
			$content.show();

			// Prevent the anchor's default click action
			e.preventDefault();
		});
	});


	//Notifications reply textarea

	$('#content section#standard .not_container .notification_wrap ul li a').click(function(){
		console.log('sam');
		$(this).parent().parent().parent().find('form.message').slideToggle();

	});


	//Terms and conditions

	$('#agree').click(function(){
	    if($(this).is(':checked')){
			$('#content section#standard form#candidate .terms_wrap').slideUp();			    
		} else {
	       $('#content section#standard form#candidate .terms_wrap').slideDown();	
	    }
	});

	//Advanced Search Toggle

	$('#advanced_search fieldset legend a').click(function(){
		$(this).parent().parent().find('div').slideToggle();
	});

	$('#zoo_visitor_form').profanityFilter({
		externalSwears: '/assets/js/swearWords.json'
	});

	// Validation - Registration

	$('#candidate').validate({
		errorElement: 'div',
		errorClass: 'bg-danger required',
		rules: {
			email: {
				required: true,
				email: true
			},
			email_confirm: {
				required: true,
				email: true,
				equalTo: 'input[name="email"]'
			},
			password: {
				required: true,
				minlength: 6
			},
			password_confirm: {
				required: true,
				minlength: 6,
				equalTo: 'input[name="password"]'
			},
			candidate_phone: {
				required: true,
				minlength: 6,
				digits: true
			},
/*
			employer_phone: {
				required: true,
				minlength: 6,
				digits: true
			},
*/
			employer_contact_phone: {
				required: true,
				minlength: 6,
				digits: true
			},
			other_county: "required",
			employer_name: "required",
			main_contact: "required",
			main_contact_position: "required",
			address_1: "required",
			town_city: "required",
			state_region: "required",
			accept_terms: "required",
			candidate_first_name: "required",
			candidate_last_name: "required",
			employer_website: "required",
			employer_position: "required",
			employer_contact_name: "required",
			employer_contact_email: "required"
		}
		// errorPlacement: function(error, element) {
		// 	error.insertAfter( element.closest('div') );
		// }
		// highlight: function(element) {
		// 	//$(element).previous().removeClass('bg-danger');
		// },
		// success: function(element) {
		// 	$(element).text('OK!').closest('.required').removeClass('bg-danger').addClass('bg-success');
	 // 		//$(element).parent().find('.required').removeClass('bg-danger');
		// }
	});

	// $('#keyInfo').validate({
	// 	errorElement: 'div',
	// 	errorClass: 'bg-danger required',
	// 	rules: {
	// 		username: {
	// 			required: true,
	// 			email: true
	// 		},
	// 		password: {
	// 			required: true,
	// 			minlength: 6
	// 		},
	// 		password_confirm: {
	// 			required: true,
	// 			minlength: 6,
	// 			equalTo: 'input[name="password"]'
	// 		},
	// 		candidate_phone: {
	// 			required: true,
	// 			minlength: 6,
	// 			digits: true
	// 		},
	// 		employer_phone: {
	// 			required: true,
	// 			minlength: 6,
	// 			digits: true
	// 		},
	// 		employer_contact_phone: {
	// 			required: true,
	// 			minlength: 6,
	// 			digits: true
	// 		},
	// 		other_county: "required",
	// 		employer_name: "required",
	// 		main_contact: "required",
	// 		main_contact_position: "required",
	// 		address_1: "required",
	// 		town_city: "required",
	// 		state_region: "required",
	// 		accept_terms: "required",
	// 		candidate_first_name: "required",
	// 		candidate_last_name: "required",
	// 		employer_website: "required",
	// 		employer_position: "required",
	// 		employer_contact_name: "required",
	// 		employer_contact_email: "required"
	// 	}
	// });
});