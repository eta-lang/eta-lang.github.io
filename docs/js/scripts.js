jQuery(document).on('mouseover', '.tabs__nav > div', function() {
	if(jQuery(window).width() < 767 ) {
		return false;
	}

	var hTab = jQuery(this).parents('.tabs');
	hTab.find('.tab__content-container').show();
	var index = jQuery(this).index();
	hTab.find('.tabs__nav').find('div').removeClass('active');
	jQuery(this).addClass('active');

	hTab.find('.tabs__section').hide();
	hTab.find('.tabs__section').eq(index).show();
});

var touchmoved;
jQuery(document).on('touchend', '.tabs__nav > div', function() {
	if(touchmoved === true || jQuery(window).width() > 769 ){
		return;
	}
	var target = jQuery(this).attr('data-src');
	jQuery.fancybox.open({
		src  : target,
		type : 'inline'
	});
}).on('touchmove', function(e){
    touchmoved = true;
}).on('touchstart', function(){
    touchmoved = false;
});

jQuery(document).on('change', '#hamburger-menu-trigger', function() {

	if(jQuery('#hamburger-menu-trigger').is(':checked')) {
		jQuery('html').addClass('menu-open');
		jQuery('.site-menu').addClass('mobile-nav').prependTo('body');
	} else {
		jQuery('html').removeClass('menu-open');
		  jQuery('.site-menu').removeClass('mobile-nav').prependTo(jQuery('.site-menu-container'));
	}
});


jQuery(document).on('touchend', '.mobile-nav', function(e) {
	jQuery('#hamburger-menu-trigger').attr('checked', false);
	  jQuery('#hamburger-menu-trigger').trigger('change');
});
jQuery(document).on('touchend', '.mobile-nav .dropbtn', function(e) {
  var dropdownContent = jQuery(this).siblings().filter('.dropdown-content');
  if (dropdownContent.hasClass('dropdown-hide')) {
    dropdownContent.removeClass('dropdown-hide');
    dropdownContent.show();
  } else {
    dropdownContent.addClass('dropdown-hide');
    dropdownContent.hide();
  }
  e.stopPropagation();
});
jQuery(document).on('touchend', '.mobile-nav a, .mobile-nav label', function(e) {
	e.stopPropagation();
});
