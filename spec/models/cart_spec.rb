require 'rails_helper'

RSpec.describe Cart, type: :model do
  context 'validations cart test' do
    it 'belongs to line items' do
      t = Cart.reflect_on_association(:line_items)
      expect(t.macro).to eq(:has_many)
    end
  end
end
