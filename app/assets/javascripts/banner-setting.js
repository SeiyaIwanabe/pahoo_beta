$(document).ready(function() {
  // $('.bannerArea').slick({
  //   infinite: true,
  //   slidesToShow: 3,
  //   // slidesToScroll: 3,
  //   centerMode: true,
  //   centerPadding: '50px',
  //   swipe: true,
  //   // arrows: false
  //   swipeToSlide: true
  // });

  // // センターのバナーが大きくなる関数
  // $('.bannerArea').on('beforeChange', function(){
  //   $('.slick-center').removeClass('is--active');
  // });
  // $('.bannerArea').on('afterChange', function(){
  //   $('.slick-center').addClass('is--active');
  // });

  // pahooの左端の座標
  const pahoo_left_edge = document.getElementById('pahoo').getBoundingClientRect().left;
  const pahoo_right_edge = document.getElementById('pahoo').getBoundingClientRect().right;
  console.log(pahoo_left_edge);
  console.log(pahoo_right_edge);


  //スクロールしたら要素が出現
  const targetElement = document.querySelectorAll(".bannerContent");
  console.log(targetElement);
  document.querySelector('.bannerArea').addEventListener("scroll", function() {
    for (let i = 0; i < targetElement.length; i++) {
      const target_left_edge =  targetElement[i].getBoundingClientRect().left;
      const target_right_edge =  targetElement[i].getBoundingClientRect().right;
      // const target_center = targetElement[i].clientWidth * 0.5;
      // console.log(target_center);

      if(i === 4) {
        console.log(target_left_edge);
        console.log(target_right_edge);
        // console.log(target_center);
      }
      if(target_left_edge > pahoo_left_edge && target_right_edge < pahoo_right_edge) {
        targetElement[i].classList.add("show");
      } else {
        targetElement[i].classList.remove("show");
      }
    };
  })
  

  // for(let index = 0; index < banners.length; index++) {
  //   let banner = banners[index];
  //   console.log(banner);
  // }
  
  // var target = $('.bannerContent');
  // var rect = target.getBoundingClientRect();
  // console.log(rect.left);
  // 要素の位置を取得して変数に格納
  
  
  // // 要素の位置を取得して変数に格納
  // let offset = $('.bannerContent').offset();
  // // コンソールに表示
  // console.log(offset);

  // // 要素の位置座標を取得
  // var clientRect = document.querySelector('.bannerContent').getBoundingClientRect().left ;
  // console.log(clientRect);
  // // 画面の左端から、要素の左端までの距離
  // var x = clientRect.left ;

  // // 画面の上端から、要素の上端までの距離
  // var y = clientRect.top ;
  

});