require 'rails_helper'
require_relative '../support/devise'
describe "Features", :type => :feature do
    describe 'after login' do
    login_user
        it 'products' do
            visit products_path
            expect(page).to have_content('E-MART')
        end
        it 'add product' do
            visit new_product_path
            fill_in "Title", :with=> "Refrey"
            fill_in "Price", :with=> "150"
            click_button   "Create Product"
            expect(page).to have_content("Refrey")
        end
        it 'show product' do
            pro= FactoryBot.create(:product)
            visit products_path
            visit product_path(pro)
            expect(page).to have_content(pro.title)
        end
        it 'edit product' do
            pro= FactoryBot.create(:product)
            visit product_path(pro)
            click_link "Edit"
            expect(page).to have_content("Edit Product")
        end
        it 'update product' do
            pro= FactoryBot.create(:product)
            visit edit_product_path(pro)
            expect(page).to have_content("Edit Product")
            click_button "Update Product"
            expect(page).to have_content(pro.title)
        end
        it 'delete product' do
            pro= FactoryBot.create(:product)
            visit product_path(pro)
            click_link "Delete"
            expect(page).to have_content("E-MART")
        end
        it 'details' do
            visit new_product_path
            fill_in "Title", :with=> "Refrey"
            fill_in "Price", :with=> "150"
            click_button   "Create Product"
            expect(page).to have_content("Refrey")  
            visit products_path
            click_link "Details"
        end
        it 'Home' do
            pro= FactoryBot.create(:product)
            visit product_path(pro)
            click_link "Home"
            expect(page).to have_content("Details")
        end
        it 'show cart' do
            pro= FactoryBot.create(:product)
            visit product_path(pro)
            click_button "Add to cart"
            expect(page).to have_content("Item added to cart..!")
            click_link "Cart"
            expect(page).to have_content("Keep Shoppping")
        end
        it 'keep shopping' do
            pro= FactoryBot.create(:product)
            visit product_path(pro)
            click_button "Add to cart"
            expect(page).to have_content("Item added to cart..!")
            click_link "Cart"
            expect(page).to have_content("Keep Shoppping")
            click_link "Keep Shoppping"
            expect(page).to have_content("Details")
        end
        it 'add to cart' do
            pro= FactoryBot.create(:product)
            visit product_path(pro)
            click_button "Add to cart"
            expect(page).to have_content("Item added to cart..!")
        end
        it 'empty cart' do
            pro= FactoryBot.create(:product)
            visit product_path(pro)
            click_button "Add to cart"
            expect(page).to have_content("Item added to cart..!")
            click_button "Empty Cart"
            expect(page).to have_content("Cart was successfully destroyed.")
        end
        it 'checkout' do
            pro= FactoryBot.create(:product)
            visit product_path(pro)
            click_button "Add to cart"
            expect(page).to have_content("Item added to cart..!")
            # click_button "Go Checkout"
        end
        it 'Sign up' do
            visit products_path
            click_link "Sign Up"
            expect(page).to have_content('You are already signed in.')
        end
        it 'Sign out' do
            visit products_path
            click_link "Sign Out"
            expect(page).to have_content('Signed out successfully.')
        end
        it 'show categories' do
            visit products_path
            click_link "Categories"
            expect(page).to have_content("Categories Details")
        end
        it 'show purchases' do
            visit products_path
            click_link "Purchases"
            expect(page).to have_content("PURCHASES")
        end
        it 'create category' do
            visit products_path
            click_link "New category"
            expect(page).to have_content('New Category')
            fill_in "Title", :with => "Temp"
            click_button "Create Category"
            expect(page).to have_content("Categories Details")
        end
        it 'create product' do
            visit products_path
            click_link "New Product"
            expect(page).to have_content('New Product')
            fill_in "Title", :with => "Temp"
            fill_in "Price", :with => "170"
            click_button "Create Product"
            expect(page).to have_content("Temp")
        end
    end
    describe 'without login' do
        it "signs users in failure" do
            visit new_user_session_path
            fill_in "Email", :with => "left@devshop.com"
            fill_in "Password", :with => "123456"
            click_button "Log in"
            expect(page).to have_content('Invalid Email or password.')
        end
        it "signs users in success" do
            user =  FactoryBot.create(:user)
            visit new_user_session_path
            fill_in "Email", :with => user.email
            fill_in "Password", :with => user.password
            click_button "Log in"
            expect(page).to have_content('Signed in successfully.')
        end
        it "sign up failure" do
            visit products_path
            click_link "Sign Up"
            expect(page).to have_content("Password confirmation")
            fill_in "Email", :with => "right@dev.com"
            click_button "Sign up"
            expect(page).to have_content("saved")
        end
        it "sign up success" do
            visit products_path
            click_link "Sign Up"
            expect(page).to have_content("Password confirmation")
            fill_in "Email", :with => "right@dev.com"
            fill_in "Password", :with => "123456"
            fill_in "Password confirmation", :with => "123456"
            click_button "Sign up"
            expect(page).to have_content("Welcome! You have signed up successfully.")
        end
        it 'sign out' do
            user =  FactoryBot.create(:user)
            visit new_user_session_path
            fill_in "Email", :with => user.email
            fill_in "Password", :with => user.password
            click_button "Log in"
            expect(page).to have_content('Signed in successfully.')
            visit products_path
            click_link "Sign Out"
            expect(page).to have_content('Signed out successfully.')
        end
        it 'show product' do
            pro= FactoryBot.create(:product)
            visit products_path
            visit product_path(pro)
            expect(page).to have_content(pro.title)
        end
        it 'edit product failure' do
            pro= FactoryBot.create(:product)
            visit edit_product_path(pro)
            expect(page).to have_content("You need to sign in or sign up before continuing.")
        end
        it 'edit product failure' do
            pro= FactoryBot.create(:product)
            visit edit_product_path(pro)
            expect(page).to have_content("You need to sign in or sign up before continuing.")
            user =  FactoryBot.create(:user)
            visit new_user_session_path
            fill_in "Email", :with => user.email
            fill_in "Password", :with => user.password
            click_button "Log in"
            expect(page).to have_content('Signed in successfully.')
        end
    end
end