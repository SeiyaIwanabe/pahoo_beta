$(document).ready(function() {
  (() => {
    const $video = document.querySelector('.scallPostVideo');
    const $btn = document.getElementById('showPlayPause');
    const $mute = document.getElementById('showMute');
    const $juice = document.querySelector('.show-orange-juice');
  
    // 動画の再生/停止
    function togglePlayPause() {
      if($video.paused) {
        $btn.className = 'pause';
        $video.play();
      } else {
        $btn.className = 'play';
        $video.pause();
      }
    }

    $btn.onclick = function() {
      togglePlayPause();
    }

    // progressBar
    $video.addEventListener("timeupdate", () => {
      let juicePos = $video.currentTime / $video.duration;
      $juice.style.width = juicePos * 100 + "%";
      if($video.ended) {
        $btn.className = 'play';
      }
    })

    // ミュートのon/off
    $mute.addEventListener('click', function(e) {
      $video.muted = !$video.muted;
    });


  })();
})