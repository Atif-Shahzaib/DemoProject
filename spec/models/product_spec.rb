require 'rails_helper'

RSpec.describe Product, type: :model do
  context 'validation tests' do
    it 'ensures the presence of title' do
      pro=Product.new(price: 150).save
      expect(pro).to eq(false)
    end
    it 'ensures the presence of price' do
      pro=Product.new(title: 'RSPEC').save
      expect(pro).to eq(false)
    end
  end
end