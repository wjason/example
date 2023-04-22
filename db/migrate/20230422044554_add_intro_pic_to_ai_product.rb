class AddIntroPicToAiProduct < ActiveRecord::Migration[7.0]
  def change
    add_column :ai_products, :intro_pic, :string
  end
end
