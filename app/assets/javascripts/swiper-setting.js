$(document).ready(function() {
  const swiper = new Swiper('.swiper-container', {
    effect: 'coverflow',
    rotate: 30,
    coverflowEffect: {
      depth: 500,
      modifire: 20
    },
    // 一度に表示するスライド数
    slidesPerView: 2,
    // 現在のスライドを真ん中に
    centeredSlides: true,
    loop: true,
    speed: 1000,
    autoplay: {
      delay: 800
    },
    // Optional parameters
    // direction: 'vertical',
  
    // If we need pagination
    // pagination: {
    //   el: '.swiper-pagination',
    // },
  
    // Navigation arrows
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  
    // And if we need scrollbar
    // scrollbar: {
    //   el: '.swiper-scrollbar',
    // },
  });
});