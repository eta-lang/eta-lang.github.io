jQuery(document).ready(function(){

  var body = document.body;
  var nav = document.getElementById('site-menu');
  var navOuterContainer = document.getElementById('site-menu-outer-container');

  jQuery('#site-menu-outer-container').height(jQuery('#site-menu-outer-container').height())
  function handleStickyMenu() {
    if( this.scrollY > 100 ) {
      if( body.classList.value.indexOf('stick-navbar') === -1 ) {
        body.classList.add('stick-navbar');
        body.appendChild(nav)
      }
    } else {
      if( body.classList.value.indexOf('stick-navbar') !== -1 ) {
        body.classList.remove('stick-navbar');
        nav.classList.remove('stuck');
        navOuterContainer.insertBefore(nav, navOuterContainer.childNodes[0]);
      }
    }

    if( this.scrollY > 200 && nav.classList.value.indexOf('stuck') === -1 ) {
      nav.classList.add('stuck');
    }

    if( this.scrollY <= 200 && nav.classList.value.indexOf('stuck') !== -1 ) {
      nav.classList.remove('stuck');
    }
  }

  var debouncedStickMenuHandler = debounce(function() {
  	handleStickyMenu();
  }, 25);


  if( !jQuery('body').hasClass('page-template-page page-template-signup') ) {
    window.addEventListener("scroll", debouncedStickMenuHandler, false);
  }

})
