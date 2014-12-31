class SessionsController < ApplicationController

  def create
    user = TwitterUser.find_or_create_from_auth_hash(auth_hash)
    session[:twitter_id] = user.id
    redirect_to root_path
  end

  def destroy
    session[:twitter_id] = nil
    redirect_to root_path notice: "Signed out!"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end