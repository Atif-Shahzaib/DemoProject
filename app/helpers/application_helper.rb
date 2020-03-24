module ApplicationHelper

    def cart_count_over_one
        if @cart.line_items.count >0
            return "<span>#{@cart.line_items.count}</span>".html_safe
        end 
    end

    def cart_has_items
        if user_signed_in?
            return @cart.line_items.count>0
        else
            return 0
        end
    end
end
