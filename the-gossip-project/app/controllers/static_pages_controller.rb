class StaticPagesController < ApplicationController
  
  def index
    @users = User.all
    @gossips = Gossip.all
    @colors = ["primary",  "secondary", "success", "danger", "warning", "info", "dark"]
    @i = 0
    # @gossip = Gossip.new
  # end
    # <% @rand_color = @color.sample%> 
    # @rand_color = @color.sample
    # <%= link_to 'Article', gossip_path(gossip.id), :class => "card-link btn btn-@rand_color"%><br>
    #         <%=  gossip.title %>
  end

  def welcome
    @users = User.all
    @gossips = Gossip.all
  end
  
  def user
    @user = User.all.find(params[:id])
  end

  def gossip
    @gossip = Gossip.all.find(params[:id])
  end
  def contact
  end

  def team
  end


end
