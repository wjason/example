class AddWeightToAiProductTag < ActiveRecord::Migration[7.0]
  def change
    add_column :ai_product_tags, :weight, :integer
  end
end
