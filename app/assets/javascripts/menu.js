$(document).ready(function() {

  const $hambarger = document.querySelector('.menu-wrapper');
  const $bars = document.querySelectorAll('.menu-item');

  // ハンバーガーがクリックされたらイベント発火
  $hambarger.addEventListener('click', () => {
    // index = 0;
    // while(index < $bars.length) {
    //   $bars[index].classList.toggle('show-animate');
    //   index++;
    // }
    $('#userMenuNav').animate({ "margin-bottom": 0 }, 200);
    $('#js-nav-close').css('display', 'block');
  });

  // 周りの黒背景をクリックしたらメニューと黒背景が閉じる
  $('#js-nav-close').click(function() {
    // index = 0;
    // while(index < $bars.length) {
    //   $bars[index].classList.toggle('show-animate');
    //   index++;
    // }
    $('#userMenuNav').animate({ "margin-bottom": -800 }, 200);
    $(this).css('display', 'none');
  });
});