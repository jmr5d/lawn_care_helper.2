class CreateContractServices < ActiveRecord::Migration
  def change
    create_table :contract_services do |t|
      t.references :contract, index: true
      t.references :service_type, index: true

      t.timestamps
    end
  end
end
