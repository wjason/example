class CreateAiProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :ai_products do |t|
      t.string :uuid
      t.string :name
      t.string :des
      t.text :intro
      t.text :cover
      t.string :uri
      t.string :company
      t.string :country
      t.integer :weight, default: 0
      t.integer :ai_product_sort_id

      t.timestamps
    end
    add_index :ai_products, :uuid, unique: true
  end
end
