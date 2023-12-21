$(document).ready(function() {
  // =============== Navbar ===============
  $('#hamburger').on('click', function() {
      $('#siteNavbar, .logo-wide').stop().animate({
          width: 'toggle'
      }, 0); // Adjust the animation speed (in milliseconds) as needed
  });

  $('.logo-wide').on('click', function() {
      window.location.href = '/';
  });
  // ===================================

  // =============== faq ===============
  $('.answer').hide();

  $('.toggle h3, .toggle h2').on('click', function() {
      const $this = $(this).parent();
      const $answer = $this.find('.answer');
      const $icon = $this.find('i');

      $answer.slideToggle();
      $icon.toggleClass('fa-plus fa-minus');
  });
  // ===================================

  // =============== OpenStreetMap mouse handler ===============
  $('.openStreetMap').on('click mouseleave', function(event) {
      const iFrame = $(this).find('iFrame');
      if (event.type === 'click') {
          iFrame.toggleClass('no-pointer-events');
      } else {
          iFrame.addClass('no-pointer-events');
      }
  });
  // ===================================

  // =============== anchor links ===============
  function scrollToAnchor(anchor) {
      var target = $(anchor);
      if (target.length) {
          // Get the height of the navigation bar
          var navbarHeight = $('.navbar').outerHeight();

          // Calculate the adjusted scroll position
          var adjustedScrollPosition = target.offset().top - navbarHeight;

          // Scroll to the adjusted position
          $('html, body').animate({
              scrollTop: adjustedScrollPosition
          }, 800); // Adjust the animation speed as needed
      }
  }

  // Function to handle scrolling to the anchor on page load
  function scrollToAnchorOnLoad() {
      var currentHash = window.location.hash;
      if (currentHash) {
          scrollToAnchor(currentHash);
      }
  }

  // Call the function on page load
  scrollToAnchorOnLoad();
  // ===================================

  // =============== slideshow ===============
  $.getScript("/themes/ck/js/slideshow.js");
  // ===================================
});