class CreateContracts < ActiveRecord::Migration
  def change
    create_table :contracts do |t|
      t.references :user, index: true
      t.references :property, index: true

      t.timestamps
    end
  end
end
