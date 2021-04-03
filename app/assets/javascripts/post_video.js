$(document).ready(function() {
  const postVideos = document.querySelectorAll('li .postVideo');
  // const postVideo = document.getElementById('postVideo');
  let video = postVideos[0];
  const mute = document.getElementById('mute');
  const contentHeight = $('.post-content').css("height");
  console.log(contentHeight);
  // console.log(postContents);
  const juice = document.querySelector('.orange-juice');
  
  // 最初の動画を自動再生
  video.play();
  
  // ProgressBarを表示
  video.addEventListener('timeupdate', function() {
    const juicePos = video.currentTime / video.duration;
    juice.style.width = juicePos * 100 + "%";
    if(video.end) {
      btn.className = "play";
    }
  });

  // 最初の動画の再生が終わったら次の動画を再生する
  let index = 0;
  video.addEventListener('ended', function() {
    scrollTo(0, contentHeight);
    index++;  
    if(index < postVideos.length) {
      let video = postVideos[index];
      video.play();
    } 
  });
  
  const btn = document.querySelector('#playPause');

  // mute.addEventListener('click', function(e) {
  //   video.muted = !video.muted;
  // });



  



  // function togglePlayPause() {
  //   if(video.paused) {
  //     btn.className = "pause";
  //     video.play();
  //   }
  //   else {
  //     btn.className = "play";
  //     video.pause();
  //   }
  // }

  // btn.onclick = function() {
  //   togglePlayPause();
  // };
  
});

