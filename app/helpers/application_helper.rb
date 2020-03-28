module ApplicationHelper

    def cart_count_over_one
        if @cart.ischeckout=='t'.nil?
            if @cart.line_items.count >0
                return "<span>#{@cart.line_items.count}</span>".html_safe
            end
        end 
    end

    def cart_has_items
        if @cart.ischeckout=='t'.nil?
            return @cart.line_items.count>0
        end
    end
end
