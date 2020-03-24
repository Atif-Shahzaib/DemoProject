module CurrentCart
    private

    def set_cart
        # @cart = Cart.find(session[:cart_id])
        # rescue ActiveRecord::RecordNotFound
        if user_signed_in?
            @cart= Cart.find_by(user_id: current_user.id && ischeckout=false)
            if @cart==nil
                @cart= Cart.create(user_id: current_user.id)
            end
            session[:cart_id]= @cart.id
        end
    end
end