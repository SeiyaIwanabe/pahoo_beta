$(document).ready(function() {
  (() => {
    const $video = document.querySelector('.scallPostVideo');
    const $btn = document.getElementById('showPlayPause');
    const $mute = document.getElementById('showMute');
    const $juice = document.querySelector('.show-orange-juice');

    console.log($mute); 
  
    // 動画の再生/停止
    function togglePlayPause() {
      if($video.paused) {
        $btn.className = 'pause';
        $video.play();
        document.querySelector('.show-controls').style.display = 'flex'
      } else {
        $btn.className = 'play';
        $video.pause();
        document.querySelector('.show-controls').style.display = 'none'
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

    // 音声のon/off
    $mute.addEventListener('click', function(e) {
      $video.muted = !$video.muted;
    });


  })();
})