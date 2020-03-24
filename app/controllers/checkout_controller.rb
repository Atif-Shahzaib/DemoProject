class CheckoutController < ApplicationController
    def create
        @cart= Cart.find_by(session[:id])
        if @cart.nil?
            respond_to root_path
            return
        end
        @session = Stripe::Checkout::Session.create(
            payment_method_types: ['card'],
            line_items: [{
                name: "name",
                description: @cart.line_items.count,
                amount: @cart.total_price,
                currency: 'cad',
                quantity: 1
            }],
            success_url: checkout_success_url,
            cancel_url: checkout_cancel_url
        )

        respond_to do |format|
            format.js # render create.js.erb
        end
    end
    
    def success
    end

    def cancel
    end
end
