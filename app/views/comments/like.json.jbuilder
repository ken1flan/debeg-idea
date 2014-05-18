json.count @comment.like_count
if @current_user_like
  json.idea_id @comment.idea_id
  json.comment_id @comment.id
  json.deleted @current_user_like.deleted
  json.status true
else
  json.status false
end
