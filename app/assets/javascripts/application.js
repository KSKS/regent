// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//

//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs

//= require bootstrap
//= require slick

//= require pages

//= require turbolinks

$(document).ready(function(){
  $('.home-carousel-show').slick({
    slidesToShow: 1,
    slidesToScroll: 1,
    arrows: false,
    fade: true,
    asNavFor: '.home-carousel-nav',
    autoplay: true,
    autoplayspeed: 5000,
    speed: 1200,
    centerPadding: "0px",
    lazyLoad: "progressive"
  });

  // $('.home-carousel-nav').slick({
  //   slidesToShow: 3,
  //   slidesToScroll: 1,
  //   asNavFor: '.home-carousel-show',
  //   dots: false,
  //   centerMode: true,
  //   focusOnSelect: true,
  //   centerPadding: "0px",
  //   autoplay: true,
  //   arrows: false,
  //   autoplayspeed: 5000,
  //   speed: 1200
  // });

  // if ($(window).width() >= 992) {
  //   var infoCols = $(".info-content");
  //   var maxHeight = 0;
  //   if (infoCols.length > 0) {
  //     infoCols.each(function(i, element) {
  //       if ($(element).innerHeight() > maxHeight) {
  //         maxHeight = $(element).innerHeight();
  //       }
  //     });
  //     infoCols.innerHeight(maxHeight);
  //     // infoCols.hide();
  //     // infoCols.show();
  //   }
  // }
});

