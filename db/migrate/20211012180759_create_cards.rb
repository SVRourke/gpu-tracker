class CreateCards < ActiveRecord::Migration[6.1]
  def change
    create_table :cards do |t|
      t.string :name
      t.string :manufacturer
      t.string :sku

      t.timestamps
    end
  end
end
