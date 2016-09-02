$(window).scroll(function() {
	if ($(this).scrollTop()){  
	    $('#nav-welcome').addClass("sticky");
	}
	else{
	    $('#nav-welcome').removeClass("sticky");
	}
});