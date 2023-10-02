class CreateMyContactCards < ActiveRecord::Migration[7.0]
  def change
    create_table :my_contact_cards do |t|
      t.string :avatar
      t.string :title
      t.string :QRcode
      t.string :code

      t.timestamps
    end
  end
end
