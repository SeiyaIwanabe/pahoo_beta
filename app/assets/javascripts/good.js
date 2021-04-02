$(document).ready(function() {
  //要素の取得 → クリックされたとき
  document.getElementById('js-good').addEventListener('click',function(e) {
    // イベント削除
    e.preventDefault();
    //要素の取得 → 背景色を変える
    document.getElementById('js-good').style.background='red';
  });
});
