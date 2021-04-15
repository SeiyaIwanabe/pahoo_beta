$(document).ready(function() {
  console.log('test');
  const $comment_link = document.querySelector('.commentLink');
  const $comment_nav = document.getElementById('commentNav');

  
  console.log($comment_link);
 
  //コメントリンクを押したらイベント発火
  $comment_link.addEventListener('click', (e) => {
    // e.preventDefault;
    $('#commentNav').animate({ "margin-bottom": 0 }, 200);
    $('#js-nav-close').css('display', 'block');
  });

  // 周りの黒背景をクリックしたらメニューと黒背景が閉じる
  $('#js-nav-close').click(function() {
    $('#commentNav').animate({ "margin-bottom": -900 }, 200);
    $(this).css('display', 'none');
  });

  // 非同期通信
  // function buildHTML(comment) {
  //   let html = `<li>
  //                 <div class="topPosition">
  //                   <a href=/users/${comment.user_id} class="commentUserLink"> 
  //                     <% if ${comment.user.icon} %>
  //                       <img src="/uploads/user/icon/${comment.user_id}/url" class="commentUserIcon">
  //                     <% else %>
  //                       <i class="fas fa-user-circle"></i>
  //                     <% end %>
  //                     <p class="commentUserName">${comment.user_nickname}/p>
  //                   </a>
  //                   <a href=/posts/${comment.post_id}/comments/${comment_id}, method: :delete class="deleteCommentLink">
  //                     <i class="fas fa-trash"></i>
  //                   </a>
  //                 </div>
  //                 <div class="bottomPosition">
  //                   <p class="commentContent">${comment.content}</p>
  //                   <p class="commentDatetime">${comment.created_at.strftime('%Y/%m/%d')}</p>
  //                 </div>
  //               </li>`
  //   return html;
  // }
  // $('#new-comment').on('submit', function(e) {
  //   e.preventDefault();
  //   console.log(this);
  //   let formData = new FormData(this);
  //   let url = $(this).attr('action');
  //   $.ajax({
  //     url: url,
  //     type: "POST",
  //     data: formData,
  //     dataType: 'json',
  //     processData: false,
  //     contentType: false
  //   })
  //   .done(function(data) {
  //     let html = buildHTML(data);
  //     $('.commentOutline').append(html);
  //     $('.inputComment').val('');
  //     $('.submitComment').prop('disabled', false);
  //   })
  //   .fail(function() {
  //     alert('error');
  //   })
  // });
});