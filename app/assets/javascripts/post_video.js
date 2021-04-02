$(document).ready(function() {
  const postContent = document.querySelector('post-content');
  const video = document.querySelector('.postVideo');
  const mute = document.getElementById('mute');
  const height = $('.post-content').css("height");
  console.log(height)
  // console.log(postContent);
  

  mute.addEventListener('click', function(e) {
    video.muted = !video.muted;
  });

  video.autoplay = true;

  video.addEventListener('ended', () => {
    alert('video ended!!!!');
  })

  


  const juice = document.querySelector('.orange-juice');
  const btn = document.querySelector('#playPause');

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
  
  video.addEventListener('timeupdate', function() {
    const juicePos = video.currentTime / video.duration;
    juice.style.width = juicePos * 100 + "%";
    if(video.end) {
      btn.className = "play";
    }
  });
});

