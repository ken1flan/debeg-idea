json.ideaCount @comment.like_count
if @current_user_like
  json.(@current_user_like, :id, :created_at, :updated_at)
  json.status true
else
  json.status false
end
