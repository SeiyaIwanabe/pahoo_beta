$(document).ready(function () {
  (() => {
    //処理を書く
    const $doc = document;
    const $community_tab = $doc.getElementById('js-community-tab');
    console.log('$community_tab', $community_tab);
    const $community_nav = $community_tab.querySelectorAll('[data-nav]')
    const $community_content = $community_tab.querySelectorAll('[data-content]')
  
    console.log('$community_nav', $community_nav);
    console.log('$community_content', $community_content);
  
    const init = () => {
      $community_content[0].style.display = 'block';
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
      while(index < $community_nav.length) {
        $community_content[index].style.display = 'none';
        $community_nav[index].classList.remove('is-active');
        index++;
      };

      // 対象のコンテンツをアクティブ化する
      $community_tab.querySelectorAll('[data-content="' + targetVal + '"]')[0].style.display = 'block';
      $community_nav[targetVal].classList.add('is-active');

    };

    // 全nav要素に関数を適用
    let index = 0;
    while(index < $community_nav.length) {
      $community_nav[index].addEventListener('click', (e) => handleClick(e));
      index++;
    }
  
  
  })();
})