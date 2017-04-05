class CombineItemsInCart < ActiveRecord::Migration[5.0]

  def up
    #replace multiple items for a single product in a cart with a single item
    Cart.all.each do |cart|
      #count the number of each product in the cart
      sums = cart.line_items.group(:product_id).sum(:quantity)

      sums.each do |product_id, quantity|
        if quantity > 1
          #remove individual items
          cart.line_items.where(product_id: product_id).delete_all

          #replace with a single item
          item = cart.line_items.build(product_id: product_id)
          item.quantity = quantity
          item.save!
        end #of if statement
      end #of sums.each loop
    end #of Car.all.each loop
  end #of up method

  def down #this method allows us to rollback the previous 'up' method
    #split items with quantity>1 into multiple items
    LineItem.where("quantity>1").each do |line_item|
      #add individual items
      line_item.quantity.times do
        LineItem.create(
          cart_id: line_item.cart_id,
          product_id: line_item.product_id,
          quantity: 1
        )
      end # of line_item.quantity.times

      #remove original item
      line_item.destroy
    end #of LineItem.where
  end #of down method


  # BELOW CHANGE METHOD WAS ADDED AUTOMATICALY BUT I REPLACED WITH THE ABOVE 'UP' AND 'DOWN' METHODS WHEN GETTING THE CART TO GROUP SAME ITEMS AND SHOW QUANTITY
  # def change
  # end
end
