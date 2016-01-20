class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :invoice, index: true
      t.decimal :amount

      t.timestamps
    end
  end
end
