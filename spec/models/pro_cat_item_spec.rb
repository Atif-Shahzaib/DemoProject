require 'rails_helper'

RSpec.describe ProCatItem, type: :model do
  context 'validation pro_cat_items' do
    it "belongs to category" do
      should respond_to(:category)
    end
    it "belongs to product" do
      should respond_to(:product)
    end
  end
end
