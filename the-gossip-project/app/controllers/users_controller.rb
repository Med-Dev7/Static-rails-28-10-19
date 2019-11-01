class UsersController < ApplicationController
  def new
    @user = User.new
   
  end

  def create
    @email =  params[:email]
    @password = params[:password]
    @user(email: @email, password: @password)
    # rajouter les validates dans le model user
    #  + rajouter les view en fonction de cest validate
    # + les param pour pouvoir save pour create
    if user.save
    log_in(@user)
    redirect_to sessions_new_path, :flash => {:success => "Vous etes bien enregistrez"} and return
    else
      flash[:danger] = "Invalid email/password combination #{@post.errors.full_messages}"
      render "new"
    end
  end
end
