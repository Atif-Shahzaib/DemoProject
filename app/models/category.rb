class Category < ApplicationRecord
    has_many :pro_cat_items, dependent: :destroy
    has_many :products , through: :pro_cat_items
end
