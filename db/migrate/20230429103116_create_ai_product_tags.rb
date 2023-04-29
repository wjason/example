class CreateAiProductTags < ActiveRecord::Migration[7.0]
  def change
    create_table :ai_product_tags do |t|
      t.string :name
      t.string :uuid

      t.timestamps
    end
  end
end
