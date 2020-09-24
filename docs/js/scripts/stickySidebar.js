jQuery(document).on('ready', function() {
  var stickySidebar = jQuery('#sidebar__sticky');

  if( stickySidebar.length > 0 ) {
    var sidebar = jQuery('#sidebar');
    stickySidebar.width( stickySidebar.width());
    var sidebarTop = stickySidebar.offset().top;
    var bottomSidebar = jQuery('#sidebar__bottom');
    var unstickAt = false;

    var debouncedStickSidebarHandler = debounce(function() {
    	handleStickySidebar();
    }, 10);

    window.addEventListener("scroll", debouncedStickSidebarHandler, false);

  }

  function handleStickySidebar() {
    var upperLimit = bottomSidebar.offset().top;
    var lowerLimit = sidebarTop - 40;

    var reachedLower = jQuery(window).scrollTop() > lowerLimit;
    var reachedUpper = stickySidebar.offset().top + stickySidebar.outerHeight() >= upperLimit;

    if( reachedLower && reachedUpper ) {
      sidebar.attr('data-sidebar-state', 'stuckToBottom');
      if( unstickAt === false ) {
        unstickAt = jQuery(window).scrollTop();
      }
    } else if( reachedLower && !reachedUpper ) {
      sidebar.attr('data-sidebar-state', 'stuckToTop');
    } else {
      sidebar.attr('data-sidebar-state', 'normal');
    }

    if( unstickAt !== false && jQuery(window).scrollTop() < unstickAt && sidebar.attr('data-sidebar-state') === 'stuckToBottom' ) {
      sidebar.attr('data-sidebar-state', 'stuckToTop');
    }


  }

})
