require_relative '../factories/users.rb'
module ControllerMacros
    def login_user
      before(:each) do
        if !@request.nil?
        @request.env["devise.mapping"] = Devise.mappings[:user]
        end
        user = FactoryBot.create(:user)
        sign_in user
      end
    end 
    # def login_admin
    #   before(:each) do
    #     @request.env["devise.mapping"] = Devise.mappings[:admin]
    #     sign_in FactoryBot.create(:admin) # Using factory bot as an example
    #   end
    # end
    # Show action making me bit confusing, As i know the show action need an object to display it. So i tried 
  end