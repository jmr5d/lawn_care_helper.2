class CreateProperties < ActiveRecord::Migration
  def change
    create_table :properties do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.decimal :latitude
      t.decimal :longitude
      t.decimal :altitude
      t.string :country
      t.string :zipcode
      t.references :user, index: true
      t.decimal :size_in_acres
      t.decimal :length_in_feet
      t.decimal :width_in_feet

      t.timestamps
    end
  end
end
