class CreateInvoices < ActiveRecord::Migration
  def change
    create_table :invoices do |t|
      t.references :contract, index: true

      t.timestamps
    end
  end
end
