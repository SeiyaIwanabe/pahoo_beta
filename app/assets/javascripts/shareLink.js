$(document).ready(function() {

  console.log('test');
  const $hambarger = document.querySelector('.menu-wrapper');
  const $share_link = document.querySelector('.shareLink');
  
  console.log($share_link);
  // const $menu_nav = document.getElementById('menuNav');
  // const $close = document.getElementById('js-nav-close');


  //シェアリングを押したらイベント発火
  $share_link.addEventListener('click', (e) => {
    // e.preventDefault;
    $('nav').animate({ "margin-bottom": 0 }, 200);
    $('#js-nav-close').css('display', 'block');
  });

  // 周りの黒背景をクリックしたらメニューと黒背景が閉じる
  $('#js-nav-close').click(function() {
    $('nav').animate({ "margin-bottom": -500 }, 200);
    $(this).css('display', 'none');
  });


});