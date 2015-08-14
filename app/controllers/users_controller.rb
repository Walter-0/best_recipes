class UsersController < ApplicationController
  # a suggestion for next time you do user auth would be to check out this
  # tutorial for a simpler version (robin's was designed for teaching the core
  # concepts, but I'd recommend the linked approach for it's ease of use):
  # Video:    http://adambray.me/i_can_haz_authenticationz.mp4
  # Text:     http://adambray.me/authentication_from_scratch.pdf
  
  skip_before_action :authenticate
  def sign_up
  end

  def sign_up!
    user = User.new(
      username: params[:username],
      password_digest: BCrypt::Password.create(params[:password])
    )
    if params[:password_confirmation] != params[:password]
      message = "Your passwords don't match!"
    elsif user.save
      message = "Your account has been created!"
    else
      message = "Your account couldn't be created. Did you enter a unique username and password?"
    end
    flash[:notice] = message
    redirect_to action: :sign_up
  end

  def sign_in
  end

  def sign_in!
    @user = User.find_by(username: params[:username])
    if !@user
      message = "This user doesn't exist!"
    elsif !BCrypt::Password.new(@user.password_digest).is_password?(params[:password])
      message = "Your password is incorrect!"
    else
      message = "You're signed in, #{@user.username}!"
      cookies[:username] = @user.username
      session[:user] = @user
    end
    flash[:notice] = message
    redirect_to action: :sign_in
  end

  def sign_out!
    message =  "You're signed out!"
    flash[:notice] = message
    reset_session
    redirect_to root_url
  end

end
