class GossipsController < ApplicationController
  before_action :authenticate_user#, only: [:new, :create]
  before_action :real_user, except: [:new, :create, :show] #, only: [:new, :edit, :create, :update, :destroy]
  def new
      @gossip = Gossip.new
  end

  def show
    @gossip = Gossip.all.find(params[:id])
    # @comments = Comment.all.find_all(gossip_id: params[:id] )
    @comments = Comment.where(gossip_id: params[:id]).to_a
    @comments.each do |comment|
      comment.content
    end
    puts params
    puts @gossip.user_id
    puts current_user.id
  end

  def create
  @title = params[:title]
   @content = params[:content]
  @user = current_user
  # gossip = Gossip.new(gossip_params)
  @gossip = Gossip.new(title: @title, content: @content, user_id: @user.id )

    if @gossip.save  
    # if @gossip.save
    redirect_to root_path, :flash => {:success => "Votre Gossip a bien été enregistré" } and return
    else
      # flash[:error] = "Create gossip not working. #{@post.errors.full_messages}"
      render new_gossip_path
    end
  end

  def edit
    @gossip = Gossip.find(params[:id])

    
  end

  def update
    @gossip = Gossip.all.find(params[:id])
    @user_id = current_user
    @title = params[:title]
    @content = params[:content]
    @gossip.update(title: "med",content: "tryyyyy", user_id: 12)
    @gossip.save
    # gossip_param = params.require(:gossip).permited(:title, :content:)
    # @gossip = Gossip.update(gossip_param)

    @gossip.update(title: @title,content: @content, user_id: @user_id)
    redirect_to gossip_path, :flash => {:success => "Vous bien update le gossip"} and return
  end

  def destroy
    @gossip = Gossip.all.find(params[:id])
    @gossip.delete
    redirect_to root_path, :flash => {:success => "Vous avez bien delete le gossip"} and return
  end
  private
  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end

  def real_user
    @gossip = Gossip.all.find(params[:id])
    if current_user.id != @gossip.user_id
      flash[:danger] = "Vous n etes pas le bon utilisateur de ce gossip."
      redirect_to gossip_path
    end
  end
  # def gossip_params
  #   params.require(:gossip).permited(:title, :content:)
  # end
end
