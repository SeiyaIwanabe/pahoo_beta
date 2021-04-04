$(document).ready(function() {
  const mainSlider = new Swiper('.main', {
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
    slidesPerView: '3',
    // 現在のスライドを真ん中に
    centeredSlides: true,
    loop: true,
    // 短い時間のスワイプを有効にする
    shortSwipes: true,
    // 長い時間のスワイプを有効にする
    // longSwipes: true,
    // どれくらいスワイプすると次のスライドへ進むかを指定。数字が大きければ少しのスワイプで次のスライドに進む。
    touchRatio: 2,
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
    // スワイプ中にクリックできない
    preventClicks: true,
    // autoplay: {
    //   delay: 2000,
    // },

    // Navigation arrows
    navigation: {
      nextEl: '.swiper-button-next',
      prevEl: '.swiper-button-prev',
    },
  });

  // 背景の画像
  const Thumbnail = new Swiper('.thumbnail', {
    slidesPerView: '1',
    centeredSlides: true,
    loop:true,
    setWrapperSize: true,
    effect: "fade"
  });

  // スライド遷移時にイベントが発生する slideChange というAPIを使用
  // スライダーをスライドした時にサムネイルを移動させる
  mainSlider.on('slideChange', () => {
    // realIndex は現在activeになっているスライドの番号が入っている
    Thumbnail.slideToLoop(mainSlider.realIndex);
  });
  // サムネイルをスライドした時にメインスライドを連動させる(上記と逆)
  Thumbnail.on('slideChange', () => {
    mainSlider.slideToLoop(Thumbnail.realIndex);
  });
});