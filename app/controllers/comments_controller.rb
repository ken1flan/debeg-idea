# -*- coding: utf-8 -*-
class CommentsController < ApplicationController
  before_action :authenticate

  def create
    @idea = Idea.find(params[:idea_id])
    @comment = @idea.comments.build(body: params[:comment][:body], user: current_user)

    if @comment.save
      redirect_to @idea, notice: 'コメントを追加しました！'
    else
      @comments = @idea.comments
      render 'ideas/show'
    end
  end

  def like
    @comment = Comment.find_by(idea_id: params[:idea_id], id: params[:comment_id])
    if current_user
      @current_user_like = @comment.like(current_user)
    end
  end
end
