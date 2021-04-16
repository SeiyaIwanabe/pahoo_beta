$(document).ready(function() {
  (() => {
    // 変数に$をつけるとDOM要素だよという意味になる
    // ページ全体を取得
    const $doc = document;
    const $tab = $doc.getElementById('js-tab');
    const $nav = $tab.querySelectorAll('[data-nav]');
    const $content = $tab.querySelectorAll('[data-content]');

    console.log('$nab', $nav);
    console.log('$content', $content);

    // 初期化（一番最初に実行死体処理を記述）
    const init = () => {
      $content[0].style.display = 'block';
    };
    init();

    // クリックしたら起こるイベント
    const handleClick = (e) => {
      e.preventDefault();

      // クリックされたnavとそのデータを取得
      const $this = e.target;
      const targetVal = $this.dataset.nav;
      
      console.log('$this', $this);

      // 対象外のnav,contentをすべて一旦リセットする
      let index = 0;
      while(index < $nav.length) {
        $content[index].style.display = 'none';
        $nav[index].classList.remove('is-active');
        index++;
      };

      // 対象のコンテンツをアクティブ化する
      $tab.querySelectorAll('[data-content="' + targetVal + '"]')[0].style.display = 'block';
      $nav[targetVal].classList.add('is-active');

    };

    // 全nav要素に関数を適用
    let index = 0;
    while(index < $nav.length) {
      $nav[index].addEventListener('click', (e) => handleClick(e));
      index++;
    }
    
  })();
})