$(document).ready(function() {
  console.log('test');
  const $comment_link = document.querySelector('.commentLink');
  const $comment_nav = document.getElementById('commentNav');

  
  console.log($comment_link);
 
  //コメントリンクを押したらイベント発火
  $comment_link.addEventListener('click', (e) => {
    // e.preventDefault;
    $('#commentNav').animate({ "margin-bottom": 0 }, 200);
    $('#js-nav-close').css('display', 'block');
  });

  // 周りの黒背景をクリックしたらメニューと黒背景が閉じる
  $('#js-nav-close').click(function() {
    $('#commentNav').animate({ "margin-bottom": -900 }, 200);
    $(this).css('display', 'none');
  });
});