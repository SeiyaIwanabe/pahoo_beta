$(document).ready(function() {
  const postVideos = document.querySelectorAll('li .postVideo');
  // const postVideo = document.getElementById('postVideo');
  let video = postVideos[0];
  const mute = document.getElementById('mute');
  const height = $('.post-content').css("height");
  console.log(height)
  console.log(postVideos);
  // console.log(postContents);
  console.log(video);

  video.play();

  // 最初の動画の再生が終わったら次の動画を再生する
  let index = 0;
  video.addEventListener('ended', function() {
    index++;  
    if(index < postVideos.length) {
      let video = postVideos[index];
      video.play();
    } 
  });
  

  // mute.addEventListener('click', function(e) {
  //   video.muted = !video.muted;
  // });



  


  // const juice = document.querySelector('.orange-juice');
  // const btn = document.querySelector('#playPause');

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
  
  // video.addEventListener('timeupdate', function() {
  //   const juicePos = video.currentTime / video.duration;
  //   juice.style.width = juicePos * 100 + "%";
  //   if(video.end) {
  //     btn.className = "play";
  //   }
  // });
});

