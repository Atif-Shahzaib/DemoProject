class AddIsCheckoutToCart < ActiveRecord::Migration[6.0]
  def change
    add_column :carts, :ischeckout, :boolean, default: false
  end
end
