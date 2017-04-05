module CurrentCart

  private #the below method is marked as private to prevent Rails from ever making it available as an action to the controller

    def set_cart
      @cart = Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      @cart = Cart.create
      session[:cart_id] = @cart.id
    end

end
