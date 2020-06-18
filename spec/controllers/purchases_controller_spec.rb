require 'rails_helper'
require_relative '../support/devise'
RSpec.describe PurchasesController, type: :controller do
    describe "GET /" do
        login_user
        context 'purchases contoller tests ' do
            it 'index' do
                get :index
                expect(response).to have_http_status(:successful)
            end
        end
    end
end