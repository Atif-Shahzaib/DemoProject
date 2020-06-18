require 'rails_helper'
require_relative '../support/devise'
RSpec.describe CartsController, type: :controller do
    describe "GET /" do
        login_user
        context 'carts contoller ' do
            it 'index' do
                get :index
                expect(response.status).to eq 200
            end
            it ' create ' do
                cart= FactoryBot.create(:cart)
                expect(Cart.last.ischeckout).to eq(false)
            end
            
            it ' show' do
                cart= FactoryBot.create(:cart)
                params = {id: cart.id}
                get :show, params: params
                expect(response.status).to eq 200
            end
            it ' edit' do
                cart= FactoryBot.create(:cart)
                params = {id: cart.id}
                get :edit, params: params
                expect(response.status).to eq 200
            end
            it ' delete ' do
                cart= FactoryBot.create(:cart)
                params= {id: cart.id}
                delete :destroy, params: params
                expect(Cart.where(id: cart.id).count).to eq(0)
            end
            it 'update' do
            end
        end
    end
end