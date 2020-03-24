class PurchasesController < ApplicationController

    def index
        @purchases= Cart.where(ischeckout:true)
    end
end
