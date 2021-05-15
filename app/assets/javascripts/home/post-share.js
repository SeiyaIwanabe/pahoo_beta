$(document).ready(function() {
  (() => {

    const $home_post_share_link = document.querySelectorAll('.shareLink');
    console.log($home_post_share_link);

    const handleClick = (e) => {
      e.preventDefault();
      const $this = e.target;
      const $target_share_nav = $this.parentElement.nextElementSibling;
      console.log($target_share_nav);

      // ボトムからシェアナビゲーション出現
      $this.addEventListener('click', () => {
        e.preventDefault();
        $($target_share_nav).animate({ "margin-bottom": 0 }, 200);
        $('#js-nav-close').css('display', 'block');
      });
  
      // 周りの黒背景をクリックしたらメニューと黒背景が閉じる
      $('#js-nav-close').click(function() {
        $($target_share_nav).animate({ "margin-bottom": -500 }, 200);
        $(this).css('display', 'none');
      });

    }

     // 全shareLinkに関数を適用
     let index = 0;
     while(index < $home_post_share_link.length) {
      $home_post_share_link[index].addEventListener('click', (e) => handleClick(e));
       index++;
     }

  })();
});