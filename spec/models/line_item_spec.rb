require 'rails_helper'

RSpec.describe LineItem, type: :model do
  context 'validation line items tests ' do
    it 'ensures belongs to product' do
      should respond_to(:product)
    end
    it 'ensures belongs to cart' do
      should respond_to(:cart)
    end
    # it "returns the total price" do
    #   cart= Cart.create().save
    #   pro=Product.create(title: 'ref', price: 100).save
    #   lineitem= LineItem.create(product_id: pro, cart_id: cart, quantity: 10).save
    #   lineitem.total_price== 1000
    # end
  end
end
