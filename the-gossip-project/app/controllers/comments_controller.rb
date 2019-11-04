class CommentsController < ApplicationController
  before_action :authenticate_user, only: [:new,:create]
  def new
    @comment = Comment.new
  end

  def create

    @content = params[:content]
    @gossip = params[:gossip_id]
    @user = current_user
    @comment = Comment.new(content: @content, user_id: @user.id, gossip_id: @gossip)
    if @comment.save
    redirect_to root_path, :flash => {:success => "Votre Commentaire a bien été enregistré" } and return
    else
      # flash[:danger] = "Create comment not working. #{@comment.errors.full_messages}"
      render new_gossip_path(@gossip.id)
    end
  end
  
    private
  
  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
  
end
