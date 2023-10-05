class AddDescriptMyContactCards < ActiveRecord::Migration[7.0]
  def change

    def change

      add_index :my_contact_cards, :code, unique: true

    end
  end
end
