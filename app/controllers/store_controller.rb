class StoreController < ApplicationController
  #below line negates the admin authorization for this part of the app
  skip_before_action :authorize

  include CurrentCart
  before_action :set_cart

  def index
    #redirects the store path for a locale (translation) IF a locale has been set
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    #original code (for when locale is not set)
    else
      @products = Product.order(:title)
    end
  end
end
