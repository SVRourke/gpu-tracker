class CreateStockRecords < ActiveRecord::Migration[6.1]
  def change
    create_table :stock_records do |t|
      t.boolean :available
      t.belongs_to :merchant
      t.belongs_to :card
      t.timestamps
    end
  end
end
