var $container = $('#portfolio-list');
// initialize isotope
$container.isotope({
  // options...
});

// filter items when filter link is clicked
$('#portfolio-categories .inner-wrap a').click(function(){
  var selector = $(this).attr('data-filter');
  $container.isotope({ filter: selector });
  return false;
});


function clearFolionav() {
$('#portfolio-categories .inner-wrap a').removeClass('active');
}

$('#portfolio-categories .inner-wrap a').each(function(){
 $(this).click(function() {
clearFolionav();
	 $(this).addClass('active');
 });
});


	$(window).resize(function(){
		//$('#showreel-carousel').jcarousel('destroy');
	});
	



jQuery(document).ready(function() {
	
	/*$('#mobile_menu_toggle').click(function() {
		$('nav').toggleClass('mobile_navigation', 1000);
		$('#main').toggleClass('mobile_content', 1000);
		$('footer').toggleClass('mobile_footer', 1000);
	});*/
	
	
	$('#mobile_menu_toggle').toggle(
		function() {
			//$('nav').animate({ rigth:'30%' }, 'slow', function() {
				$('#mobile_menu_toggle').html('close');
			//});
			$('#main').addClass('mobile_content');
			$('#main').animate({ left:'-70%' }, 'slow');
			//$('#header-container').animate({ left:'-70%' }, 'slow');
			$('nav').addClass('mobile_navigation');
			$('footer').addClass('mobile_footer');
		}, 
		function() {
			//$('nav').animate({ left:'100%'}, 'slow', function() {
				$('#mobile_menu_toggle').html('menu');
			//});
			$('#main').animate({ left:'0%'}, 'slow', function(){
				$('nav').removeClass('mobile_navigation');
				$('footer').removeClass('mobile_footer');
				$('#main').removeClass('mobile_content');
			});
			//$('#header-container').animate({ left:'0%' }, 'slow');

		}
	);
	
	
	jQuery('#showreel-carousel').jcarousel({start: 2, initCallback: mycarousel_initCallback});
	jQuery('#client-reel').jcarousel({scroll:5});
		
	
	$('.newswrap-arrow').hide();
		
		
	$('.news-outer').each(function() {
	$(this).mouseover(function() {
	$(this).css('cursor', 'pointer');
	$(this).children().show();
	});
	$(this).click(function() {
	newsLink = $(this).find('a').attr('href');	
	window.location = newsLink;
	});
	$(this).mouseleave(function() {
	$(this).closest('div').find('.newswrap-arrow').hide();
	});
	});
	
	$('.portfolio-column').each(function() {
	$(this).mouseover(function() {
	$(this).css('cursor', 'pointer');
	});
	$(this).click(function() {
	folioLink = $(this).find('a').attr('href');	
	window.location = folioLink;
	});
	});
	
	
	
	$('#home-services div').each(function() {
	$(this).mouseover(function() {
	$(this).css('cursor', 'pointer');
	$(this).find('a').addClass('active');	
	});
	$(this).click(function() {
	serviceLink = $(this).find('a').attr('href');
	window.location = serviceLink;
	});
	$(this).mouseleave(function() {
	$(this).find('a').removeClass('active');	
	});
	});
	
	
	
	$('.services-column').each(function() {
	$(this).mouseover(function() {
	$(this).css('cursor', 'pointer');
	$(this).find('a').addClass('active');	
	});
	$(this).click(function() {
	serviceLink = $(this).find('a').attr('href');
	window.location = serviceLink;
	});
	$(this).mouseleave(function() {
	$(this).find('a').removeClass('active');	
	});
	});
	
	
	$('.folio-wrap-sm-text').css('opacity','0');
	
	$('.folio-wrap-sm').each(function() {
	$(this).mouseover(function() {
	$(this).css('cursor', 'pointer');
	$(this).children().animate({opacity:1});
	$(this).find('a').delay(200).animate({bottom:'30px'});	
	});
	$(this).click(function() {
	homeFolioLink = $(this).find('a').attr('href');
	window.location = homeFolioLink;
	});
	});
	
	$('.folio-wrap-sm-text').each(function() {
	$(this).mouseleave(function() {
	$(this).find('a').animate({bottom:'-30px'});
	$(this).animate({opacity:0});
	});
		
		
	});
	
	
	
	
	
	$('iframe').mouseover(function() {
	$(this).css('cursor', 'pointer');
	});	
	
	
	
	var notMoving = true;
	
	$("#showreel-cover-left").mouseenter(function(){
	  $(this).css('cursor', 'pointer');
	  $('#showreel-prev').css('background-position', 'bottom left');
		if(notMoving){
			notMoving = false;
			//$("#showreel-carousel").animate({"left": "+=50px"}, "slow", function(){notMoving = true;});
		}
	});
	
	$("#showreel-cover-left").mouseleave(function(){
	  $('#showreel-prev').css('background-position', 'top left');
		if(notMoving){
			notMoving = false;
			//$("#showreel-carousel").animate({"left": "-=50px"}, "slow", function(){notMoving = true;});
		}
	});
	
	
	
	
	$("#showreel-cover-right").mouseenter(function(){
	  $(this).addClass('hovered');
	  $(this).css('cursor', 'pointer');
	  $('#showreel-next').css('background-position', 'bottom left');
		if(notMoving){
			notMoving = false;
			//$("#showreel-carousel").animate({"left": "-=50px"}, "slow", function(){notMoving = true;});
		}
	});
	
	$("#showreel-cover-right").mouseleave(function(){
	  $(this).removeClass('hovered');
	  $('#showreel-next').css('background-position', 'top left');
		if(notMoving){
			notMoving = false;
			//$("#showreel-carousel").animate({"left": "+=50px"}, "slow", function(){notMoving = true;});
		}
	});
	
	
	
	
	
	function mycarousel_initCallback(carousel) {
	   
	
		jQuery('#showreel-cover-right').bind('click', function() {
			carousel.next();
			return false;
		});
	
		jQuery('#showreel-cover-left').bind('click', function() {
			carousel.prev();
			return false;
		});
	
	jQuery('#showreel-next').bind('click', function() {
			carousel.next();
			return false;
		});
	
		jQuery('#showreel-prev').bind('click', function() {
			carousel.prev();
			return false;
		});
	
	
	};
	
	
	
	$('#folio-detail-cover-left a').mouseover(function() {
	$('.detail-prev').addClass('active');
	});
	
	
	$('#folio-detail-cover-left a').mouseleave(function() {
	$('.detail-prev').removeClass('active');
	});
	
	
	
	$('#folio-detail-cover-right a').mouseover(function() {
	$('.detail-next').addClass('active');
	});
	
	
	$('#folio-detail-cover-right a').mouseleave(function() {
	$('.detail-next').removeClass('active');
	});
	
	
	
	
	// ipad fix
	var viewportmeta = document.querySelector && document.querySelector('meta[name="viewport"]'),
	ua = navigator.userAgent;
	
	function allowscale() {
	viewportmeta.content = "width=device-width, minimum-scale=0.25, maximum-scale=3.2";
	}
	var t=setTimeout("allowscale()",1000);
	
	
	function doorientationchange(){
		if (viewportmeta && /iPhone|iPad/.test(ua) && !/Opera Mini/.test(ua)) {
			if(((window.orientation)&2)==2) {
			location.reload(false); // Safari messes up when changing into landscape mode… so reload to fix it.
			}
		}
	}
	
	document.addEventListener("orientationchange",doorientationchange,false);
	// END ipad fix


});