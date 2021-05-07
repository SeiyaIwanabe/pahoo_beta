$(document).ready(function() {
  (() => {
    const $home_post_menu_link = document.querySelectorAll('.indexPostMenuLink');
    console.log($home_post_menu_link);

    const handleClick = (e) => {
      e.preventDefault();
      const $this = e.target;
      const $target_menu_nav = $this.parentElement.nextElementSibling;

      console.log('$this', $this);
      console.log('$target_menu_nav', $target_menu_nav);

      // ボトムからコメントナビゲーション出現
      $this.addEventListener('click', () => {
        e.preventDefault();
        $($target_menu_nav).animate({ "margin-bottom": 0 }, 200);
        $('#js-nav-close').css('display', 'block');
      });

      // 周りの黒背景をクリックしたらメニューと黒背景が閉じる
      $('#js-nav-close').click(function() {
        $($target_menu_nav).animate({ "margin-bottom": -300 }, 200);
        $(this).css('display', 'none');
      });

    };


    // 全menuLinkに関数を適用
    let index = 0;
    while(index < $home_post_menu_link.length) {
      $home_post_menu_link[index].addEventListener('click', (e) => handleClick(e));
      index++;
    }
  })();
})