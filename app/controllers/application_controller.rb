class ApplicationController < ActionController::Base
  #below line limits access to every part of the app to only admins...
  #...we allow the non-admin parts of the app to non-admins by listing methods/controllers for which authorization is not required (see individual controllers)
  before_action :authorize

  protect_from_forgery with: :exception

  protected

    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end

end
