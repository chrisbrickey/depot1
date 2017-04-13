class StoreController < ApplicationController
  #below line negates the admin authorization for this part of the app
  skip_before_action :authorize

  include CurrentCart
  before_action :set_cart

  def index
    @products = Product.order(:title)
  end
end
