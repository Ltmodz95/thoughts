document.querySelectorAll('.update-comment').forEach(btn => {
  btn.addEventListener('click',($event)=>{
   commentId = $event.target.dataset.commentId;
   commentUpdateForm = document.querySelector(`[data-form-comment='${commentId}']`);
   commentBody = document.querySelector(`[data-comment-body='${commentId}']`);
   hideCommentUpdateBtn = document.querySelector(`[data-hide-comment-id='${commentId}']`);
   commentUpdateForm.style.display = 'flex';
   commentBody.style.display ='none'
   hideCommentUpdateBtn.style.display = 'block'
   btn.style.display ='none'
  })
});

document.querySelectorAll('.hide-comment-update').forEach(btn => {
  btn.addEventListener('click',($event)=>{
   commentId = $event.target.dataset.hideCommentId;
   commentUpdateForm = document.querySelector(`[data-form-comment='${commentId}']`);
   commentBody = document.querySelector(`[data-comment-body='${commentId}']`);
   commentUpdateBtn = document.querySelector(`[data-comment-id='${commentId}']`);
   commentUpdateForm.style.display = 'none';
   commentBody.style.display ='flex'
   commentUpdateBtn.style.display = 'block'
   btn.style.display ='none'
  })
});