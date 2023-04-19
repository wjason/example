class CreateAiProductSorts < ActiveRecord::Migration[7.0]
  def change
    create_table :ai_product_sorts do |t|
      t.string :name
      t.string :uuid
      t.integer :weight, default: 0

      t.timestamps
    end

    add_index :ai_product_sorts, :uuid, unique: true
  end
end
