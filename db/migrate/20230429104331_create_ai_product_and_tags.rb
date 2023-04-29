class CreateAiProductAndTags < ActiveRecord::Migration[7.0]
  def change
    create_table :ai_product_and_tags do |t|
      t.integer :ai_product_id
      t.integer :ai_product_tag_id

      t.timestamps
    end
  end
end
