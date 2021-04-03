$(document).ready(function() {
  const swiper = new Swiper('.swiper-container', {
    effect: 'coverflow',
    grabCursor: true,
    coverflowEffect: {
      rotate: 0,
      stretch: 0,
      depth: 500,
      modifire: 4,
      slideShadows: true
    },
    // 一度に表示するスライド数
    slidesPerView: 'auto',
    // 現在のスライドを真ん中に
    centeredSlides: true,
    loop: true,
    touchRatio: 10,
    shortSwipes: true,
    passiveListeners: true,
    freeMode: true,
    freeModeMomentum: true,
    freeModeMomentumRatio: 10,
    freeModeMomentumVelocityRatio: 10, 
    // speed: 100,
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