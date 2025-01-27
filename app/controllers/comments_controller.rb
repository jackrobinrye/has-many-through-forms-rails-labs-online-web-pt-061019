require 'pry'
class CommentsController < ApplicationController

  def create
    if params["comment"]["user_attributes"]["username"] != ""
      comment = Comment.create(comment_params)
    else 
      comment = Comment.create(params.require(:comment).permit(:content, :post_id, :user_id))
    end 
    redirect_to comment.post
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :user_id, user_attributes:[:username])
  end
end
