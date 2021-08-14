$(document).ready(function() {
  (() => {
    const $create_link = document.getElementById('createLink');

    // リンクをクリック時にナビゲーション出現
    $create_link.addEventListener('click', () => {
      $('#createNav').animate({ "margin-bottom": 0 }, 500);
      $('#js-nav-close').css('display', 'block');
    })

    // 周りの黒背景をクリックしたらメニューと黒背景が閉じる
    $('#js-nav-close').click(function() {
      $('#createNav').animate({ "margin-bottom": -500 }, 500);
      $(this).css('display', 'none');
    });

  })();
})