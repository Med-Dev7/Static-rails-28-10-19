class GossipsController < ApplicationController
  def new    
      @gossip = Gossip.new
  end

  def create
  @title = params[:title]
  @content = params[:content]  
  @gossip = Gossip.new#(title: "try success", content: "fails is the way", user_id: 1)
  
  if @gossip.save
    redirect_to root_path, :flash => {:success => "Votre Gossip a bien été enregistré" } and return
  else
    # flash[:error] = "Create gossip not working. #{@post.errors.full_messages}"
    render new_gossip_path
  end
  end
end
