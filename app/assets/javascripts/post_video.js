$(document).ready(function() {

  const $btn = document.querySelectorAll('#playPause');
  
  // 最初の動画を自動再生
  // video.play();

  // 最初の動画の再生が終わったら次の動画を再生する
  // let index = 0;
  // video.addEventListener('ended', function() {
  //   scrollTo(0, contentHeight);
  //   index++;  
  //   if(index < postVideos.length) {
  //     let video = postVideos[index];
  //     video.play();
  //   } 
  // });

  // $('button').click(function() {
  //   const btn = $(this);
  //   console.log(btn);
  // })

  const handleClick = (e) => {
    const $this = e.target;
    const $target_label = $this.closest('.btnLabel');
    const $target_video = $target_label.parentNode.firstElementChild;
    const $target_mute_btn = $target_label.nextElementSibling;
    const $target_video_bar = $target_video.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.firstElementChild;
    
    console.log('$this', $this);
    


    //動画の再生/停止
    function togglePlayPause() {
      if($target_video.paused) {
        $this.className = "pause";
        $target_video.play();
      }
      else {
        $this.className = "play";
        $target_video.pause();
      }

      // 音声のon/off
      $target_mute_btn.addEventListener('click', function(e) {
        $target_video.muted = !$target_video.muted;
      });
    }
    $this.onclick = function() {
      togglePlayPause();
    };

    // ProgressBarを表示
    $target_video.addEventListener('timeupdate', function() {
      const $juicePos = $target_video.currentTime / $target_video.duration;
      $target_video_bar.style.width = $juicePos * 100 + "%";
      if($target_video.end) {
        $this.className = "play";
      }
    });
  }

  // 全$btnに関数を適用
  let index = 0;
  while(index < $btn.length) {
    $btn[index].addEventListener('click', (e) => handleClick(e));
    index++;
  }


});