$(document).ready(function() {
  console.log('test');

  const $home_post_comment_link = document.querySelectorAll('.commentLink');
  console.log($home_post_comment_link);


  const handleClick = (e) => {
    e.preventDefault();

    // クリックされたnavとそのデータを取得
    const $this = e.target;
    // const $this_next = e.target.next('#commentNav');

    console.log('$this', $this);
    // console.log('$this_next', $this_next);


    // ボトムからコメントナビゲーション出現
    $this.addEventListener('click', () => {
      e.preventDefault();
      $('#commentNav').animate({ "margin-bottom": 0 }, 200);
      // $(this).parent('.commentLink').next('#commentNav').animate({ "margin-bottom": 0 }, 200);
      // closestメソッドが使えるかも
      $('#js-nav-close').css('display', 'block');
    });

    // 周りの黒背景をクリックしたらメニューと黒背景が閉じる
    $('#js-nav-close').click(function() {
      $('#commentNav').animate({ "margin-bottom": -900 }, 200);
      $(this).css('display', 'none');
    });
  };

  // 全commentLinkに関数を適用
  let index = 0;
  while(index < $home_post_comment_link.length) {
    $home_post_comment_link[index].addEventListener('click', (e) => handleClick(e));
    index++;
  }

});