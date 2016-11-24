class CreateApartments < ActiveRecord::Migration
  def change
    create_table :apartments do |t|
      t.string :apartment_name
      t.string :address
      t.string :city
      t.string :state
      t.integer :zip
      t.integer :bedrooms
      t.integer :bathrooms

      t.timestamps

    end
  end
end
