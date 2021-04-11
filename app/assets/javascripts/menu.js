$(document).ready(function() {

  console.log('test');
  const $hambarger = document.querySelector('.menu-wrapper');
  // const $menu_nav = document.getElementById('menuNav');
  // const $close = document.getElementById('js-nav-close');



  // ハンバーガーがクリックされたらイベント発火
  $hambarger.addEventListener('click', () => {
    // menu.classList.toggle('show-animate');
    $('nav').animate({ "margin-bottom": 0 }, 200);
    $('#js-nav-close').css('display', 'block');
  });

  // 周りの黒背景をクリックしたらメニューと黒背景が閉じる
  $('#js-nav-close').click(function() {
    $('nav').animate({ "margin-bottom": -800 }, 200);
    $(this).css('display', 'none');
  });

});