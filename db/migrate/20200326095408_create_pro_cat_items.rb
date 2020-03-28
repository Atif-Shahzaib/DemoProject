class CreateProCatItems < ActiveRecord::Migration[6.0]
  def change
    create_table :pro_cat_items do |t|
      t.references :category, null: false, foreign_key: true
      t.belongs_to :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end