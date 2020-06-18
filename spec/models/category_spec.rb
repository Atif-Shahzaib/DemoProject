require 'rails_helper'

RSpec.describe Category, type: :model do
  context 'validation category tests' do
    it "has many pro cat items" do
      should respond_to(:pro_cat_items)
    end
    it "has many prodcuts" do
      t = Category.reflect_on_association(:products)
      expect(t.macro).to eq(:has_many)
    end
  end
end
