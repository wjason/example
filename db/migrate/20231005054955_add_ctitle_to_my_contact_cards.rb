class AddCtitleToMyContactCards < ActiveRecord::Migration[7.0]
  def change
    add_column :my_contact_cards, :cdescription, :string
    add_column :my_contact_cards, :ctitle, :string
    add_column :my_contact_cards, :cpic,:string
  end
end
