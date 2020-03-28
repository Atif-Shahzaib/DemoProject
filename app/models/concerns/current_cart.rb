module CurrentCart
    private

    def set_cart
        if current_user
            @cart = Cart.find_by(user_id: current_user.id , ischeckout:'f')
            if @cart.nil?
                @cart= Cart.find_by_id(session[:cart_id])
                if @cart.nil?
                    @cart ||= Cart.create(user_id: current_user.id)
                else
                    @cart.user_id= current_user.id
                end
            end
        else
            @cart= Cart.find_by_id(session[:cart_id])
            if @cart.nil?
                @cart= Cart.create
            end
        end
        session[:cart_id] = @cart.id
    end
end