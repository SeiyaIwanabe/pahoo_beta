$(document).ready(function() {
  const swiper = new Swiper('.swiper-container', {
    effect: 'coverflow',
    grabCursor: true,
    coverflowEffect: {
      rotate: 20,
      stretch: 0,
      depth: 400,
      modifire: 1,
      slideShadows: true
    },
    // 一度に表示するスライド数
    slidesPerView: 'auto',
    // 現在のスライドを真ん中に
    centeredSlides: true,
    loop: true,
    speed: 100,
    // autoplay: {
    //   delay: 800
    // },
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