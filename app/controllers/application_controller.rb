class ApplicationController < ActionController::Base
  #this is a 'callback', it sets the locale from the params- only if there is a local in the params (per the way we defined the method below)
  before_action :set_i18n_locale_from_params

  #below line limits access to every part of the app to only admins...
  #...we allow the non-admin parts of the app to non-admins by listing methods/controllers for which authorization is not required (see individual controllers)
  before_action :authorize

  protect_from_forgery with: :exception

  protected

    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.map(&:to_s).include?(params[:locale])
          I18n.locale = params[:locale]
        else
          flash.now[:notice] =
            "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

    def authorize
      unless User.find_by(id: session[:user_id])
        redirect_to login_url, notice: "Please log in"
      end
    end

end
