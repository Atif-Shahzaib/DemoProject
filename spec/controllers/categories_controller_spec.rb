require 'rails_helper'
require_relative '../support/devise'
RSpec.describe CategoriesController, type: :controller do
    describe "GET /" do
        login_user
        context 'categories contoller tests ' do
            it 'index' do
                get :index
                expect(response.status).to eq 200
            end
            it  'new' do
                cat = FactoryBot.create(:category)
                params= {id: cat.id}
                get :new, params: params
                expect(response.status).to eq 200
            end
            it ' show' do
                cat = FactoryBot.create(:category)
                params = {id: cat.id}
                get :show, params: params
                expect(response.status).to eq 200
            end
            it ' edit' do
                cat = FactoryBot.create(:category)
                params = {id: cat.id}
                get :edit, params: params
                expect(response.status).to eq 200
            end
            it 'delete' do
                cat = FactoryBot.create(:category)
                params= {id: cat.id}
                delete :destroy, params: params    
                expect(Category.where(id: cat.id).count).to eq(0)
            end
            it 'create ' do
                cat = FactoryBot.create(:category)
                expect(Category.last.title).to eq("temp")
            end
        end
    end
end