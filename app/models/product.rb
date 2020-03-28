class Product < ApplicationRecord
    before_destroy :not_referenced_by_any_line_item
    has_many :line_items
    has_many :pro_cat_items , dependent: :destroy
    has_many :categories, through: :pro_cat_items
    mount_uploader :image, ImageUploader
    validates :title, :price, :image, presence: true
    validates :title, length: {minimum: 3}
    validates :price, numericality: {only_integer: true}, length: {maximum: 7}
    
    private

    def not_referenced_by_any_line_item
        unless line_items.empty?
            errors.add(:base, "Line items present")
            throw(:abort) 
        end
    end

end
