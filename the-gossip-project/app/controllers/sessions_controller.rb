class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @email =  params[:email]
    @password = params[:password]  

    puts params
    # cherche s'il existe un utilisateur en base avec l’e-mail
    @user = User.find_by(email: @email)
    # @user = User.find_by(email: "email@email.com")
    # on vérifie si l'utilisateur existe bien ET si on arrive à l'authentifier (méthode bcrypt) avec le mot de passe    
    if @user && @user.authenticate(@password)#user.authenticate(password_dans_ton_params)     
    # if @user && @user.authenticate("email")#user.authenticate(password_dans_ton_params) 
      log_in(@user)
      # redirige où tu veux, avec un flash ou pas
      redirect_to root_path, :flash => {:success => "Vous etes bien enregistrez"} and return
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render "new"
    end
  end
    
  def destroy
    session.delete(:user_id)
    redirect_to root_path, :flash => {:success => "Vous etes bien deconnecter"} and return
  end

end
