$(document).ready(function() {
  const video = document.querySelector('.postVideo');
  const btn = document.querySelector('#playPause');
  const mute = document.getElementById('mute');
  const juice = document.querySelector('.orange-juice');
  
  
  // ProgressBarを表示
  video.addEventListener('timeupdate', function() {
    const juicePos = video.currentTime / video.duration;
    juice.style.width = juicePos * 100 + "%";
    if(video.end) {
      btn.className = "play";
    }
  });

  
  // 動画の再生/停止
  function togglePlayPause() {
    if(video.paused) {
      btn.className = "pause";
      video.play();
    }
    else {
      btn.className = "play";
      video.pause();
    }
  }
  btn.onclick = function() {
    togglePlayPause();
  };
  
  mute.addEventListener('click', function(e) {
    video.muted = !video.muted;
  });

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

  
});