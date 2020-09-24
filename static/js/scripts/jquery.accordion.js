jQuery('.accordion:not([data-state="open"]):not(.accordion--sm-only) .accordion__content').hide()


if ( jQuery(window).width() < 768 ) {
  jQuery('.accordion:not([data-state="open"]) .accordion__content').hide()
}

jQuery(document).on('change', '.accordion input', function() {
  var name = jQuery(this).attr('name');
  var thisInput = this;
  var otherContent = jQuery('input[name="' + name +'"]').not(thisInput).parents('.accordion').find('.accordion__content');

  var thisContent = jQuery(this).parents('.accordion').find('.accordion__content');

  if(jQuery(this).is(':checked')) {
    otherContent.slideUp(300);
    thisContent.slideDown(300);
  } else {
    otherContent.slideDown(300);
    thisContent.slideUp(300);
  }
})
