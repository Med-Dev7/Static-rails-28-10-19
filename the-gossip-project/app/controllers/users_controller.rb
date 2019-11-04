class UsersController < ApplicationController
  def new
    @user = User.new
   
  end

  def create
    @email =  params[:email]
    @password = params[:password]
    @user = User.create(email: @email, password: @password)
    puts @user.email
    puts @user.password
    # rajouter les validates dans le model user
    #  + rajouter les view en fonction de cest validate
    # + les param pour pouvoir save pour create
    if @user.save
      log_in(@user)
      redirect_to root_path, :flash => {:success => "Votre compte a bien etait cree"} and return
    else
      flash[:danger] = "Invalid email/password combination #{@user.errors.full_messages}"
      render "new"
    end
  end
end
