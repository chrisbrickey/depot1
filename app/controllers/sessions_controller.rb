class SessionsController < ApplicationController
  #below line negates the admin authorization for this part of the app
  skip_before_action :authorize

  def new
  end

  def create
    user = User.find_by(name: params[:name])
      if user.try(:authenticate, params[:password]) #try method checks to see if something's value is nil before trying to call the method
        session[:user_id] = user.id
        redirect_to admin_url
      else
        redirect_to login_url, alert: "Invalid user/password combination"
      end
  end

  def destroy
    session[:user_id] = nil
    redirect_to store_index_url, notice: "Logged out"
  end

end
