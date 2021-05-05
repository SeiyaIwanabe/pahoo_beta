$(document).ready(function() {

  const $menu_link = document.querySelector('.postMenuLink');
  
  //シェアリングを押したらイベント発火
  $menu_link.addEventListener('click', (e) => {
    e.preventDefault;
    $('#postMenuNav').animate({ "margin-bottom": 0 }, 200);
    $('#js-nav-close').css('display', 'block');
  });

  // 周りの黒背景をクリックしたらメニューと黒背景が閉じる
  $('#js-nav-close').click(function() {
    $('#postMenuNav').animate({ "margin-bottom": -200 }, 200);
    $(this).css('display', 'none');
  });
});