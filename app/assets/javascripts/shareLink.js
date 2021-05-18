$(document).ready(function() {

  const $share_link = document.querySelector('.shareLink');
  
  //シェアリングを押したらイベント発火
  $share_link.addEventListener('click', (e) => {
    // e.preventDefault;
    $('#shareNav').animate({ "margin-bottom": 0 }, 200);
    $('#js-nav-close').css('display', 'block');
  });

  // 周りの黒背景をクリックしたらメニューと黒背景が閉じる
  $('#js-nav-close').click(function() {
    $('#shareNav').animate({ "margin-bottom": -500 }, 200);
    $(this).css('display', 'none');
  });
});