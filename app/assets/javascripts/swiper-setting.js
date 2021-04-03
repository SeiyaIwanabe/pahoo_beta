$(document).ready(function() {
  const swiper = new Swiper('.swiper-container', {
    effect: 'coverflow',
    grabCursor: true,
    coverflowEffect: {
      rotate: 0,
      stretch: 0,
      depth: 500,
      modifire: 1,
      slideShadows: true
    },
    // 一度に表示するスライド数
    slidesPerView: '2.8',
    // 現在のスライドを真ん中に
    centeredSlides: true,
    loop: true,
    // どれくらいスワイプすると、次のスライドへ進むかを指定。数字が大きければ少しのスワイプで次のスライドに進む。
    touchRatio: 3,
    // スマホのパフォーマンスを高める
    passiveListeners: true,
    // スライドした際に特定のスライドにピタッと止まらなくなり、滑るようにスライドする。
    freeMode: true,
    // スライド時に惰性でしばらく動く（freeMode: trueが前提）
    freeModeMomentum: true,
    // 数字が大きいほど惰性スクロールの距離が伸び
    freeModeMomentumRatio: 1,
    // 数字が大きいほど惰性スクロールのスピードが速くなる
    freeModeMomentumVelocityRatio: 1, 
    // freeModeを開始するトリガー的スワイプの最小速度の設定
    // freeModeMinimumVelocity: 0.02,
    // 惰性が終わって止まる時に一番近くのスライドにスナップする
    freeModeSticky: true,


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