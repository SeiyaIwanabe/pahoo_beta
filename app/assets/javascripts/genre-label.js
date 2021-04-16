$(document).ready(function() {
  (() => {
    
    const $label = document.querySelectorAll('.genreLabel')
    console.log($label);


    const handleClick = (e) => {
      const $this = e.target;

      // labelをタップしたらis-activeクラスを付与
      $this.addEventListener('click', () => {
        $this.classList.toggle('is-active');
      });
    }

    // 全$label要素に関数を適用
    let index = 0;
    while(index < $label.length) {
      $label[index].addEventListener('click', (e) => handleClick(e));
      index++;
    }
  
  })();
});