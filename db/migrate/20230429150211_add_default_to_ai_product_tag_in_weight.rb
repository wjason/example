class AddDefaultToAiProductTagInWeight < ActiveRecord::Migration[7.0]
  def change
    change_column_default :ai_product_tags, :weight, 0
  end
end
