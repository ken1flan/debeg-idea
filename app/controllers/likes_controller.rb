# -*- coding: utf-8 -*-
class LikesController < ApplicationController
  before_action :authenticate, except: :show

  def idea
    @idea = Idea.find(params[:likable_id])
    if current_user
      @current_user_like = @idea.like(current_user)
    end
  end

  def comment
    @comment = Comment.find(params[:likable_id])
    if current_user
      @current_user_like = @comment.like(current_user)
    end
  end
end
