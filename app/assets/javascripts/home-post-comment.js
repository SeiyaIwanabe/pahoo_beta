$(document).ready(function() {
  (() => {

    const $home_post_comment_link = document.querySelectorAll('.commentLink');
  
    const handleClick = (e) => {
      e.preventDefault();
  
      // クリックされたnavとそのデータを取得
      const $this = e.target;
      const $target_nav = $this.parentElement.nextElementSibling;
      const $target_video = $target_nav.previousElementSibling;
      const $object_position = $target_video.getBoundingClientRect().bottom;
  
      console.log('$this', $this);
      console.log('$target_nav', $target_nav);
      console.log('$target_video', $target_video);
      console.log('$object_position', $object_position);
  
  
      // ボトムからコメントナビゲーション出現
      $this.addEventListener('click', () => {
        e.preventDefault();
        $($target_nav).animate({ "margin-bottom": 0 }, 200);
        $('#js-nav-close').css('display', 'block');
      });
  
      // 周りの黒背景をクリックしたらメニューと黒背景が閉じる
      $('#js-nav-close').click(function() {
        $($target_nav).animate({ "margin-bottom": -900 }, 200);
        $(this).css('display', 'none');
      });
    };
  
    // 全commentLinkに関数を適用
    let index = 0;
    while(index < $home_post_comment_link.length) {
      $home_post_comment_link[index].addEventListener('click', (e) => handleClick(e));
      index++;
    }

  })();
});