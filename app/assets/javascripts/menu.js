$(document).ready(function() {

  console.log('test');
  const $hambarger = document.querySelector('.menu-wrapper');
  const $bars = document.querySelectorAll('.menu-item');

  
  // const $menu_nav = document.getElementById('menuNav');
  // const $close = document.getElementById('js-nav-close');



  // ハンバーガーがクリックされたらイベント発火
  $hambarger.addEventListener('click', () => {
    index = 0;
    while(index < $bars.length) {
      $bars[index].classList.toggle('show-animate');
      index++;
    }
    $('nav').animate({ "margin-bottom": 0 }, 200);
    $('#js-nav-close').css('display', 'block');
  });

  // 周りの黒背景をクリックしたらメニューと黒背景が閉じる
  $('#js-nav-close').click(function() {
    index = 0;
    while(index < $bars.length) {
      $bars[index].classList.toggle('show-animate');
      index++;
    }
    $('nav').animate({ "margin-bottom": -800 }, 200);
    $(this).css('display', 'none');
  });


});