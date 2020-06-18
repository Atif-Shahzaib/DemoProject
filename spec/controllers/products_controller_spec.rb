require 'rails_helper'
require_relative '../support/devise'
RSpec.describe ProductsController, type: :controller do
    describe "GET /" do
        login_user
        context 'products contoller ' do
            it ' create ' do
                pro = FactoryBot.create(:product)
                cat = FactoryBot.create(:category)
                expect(Product.last.title).to eq("temp")
                expect(Category.last.title).to eq("temp")
            end
            it ' index' do
                get :index
                expect(response.status).to eq 200
            end
            it ' show' do
                pro = FactoryBot.create(:product)
                params = {id: pro.id}
                get :show, params: params
                expect(response.status).to eq 200
            end
            it 'edit' do
                pro = FactoryBot.create(:product)
                params = {id: pro.id}
                get :edit, params: params
                expect(response.status).to eq 200
            end
            it 'delete' do
                pro= FactoryBot.create(:product)
                params= {id: pro.id}
                delete :destroy, params: params
                expect(Product.where(id: pro.id).count).to eq(0)
            end
        end
    end
end