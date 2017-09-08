class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :product, index: true
      t.integer :count

      t.timestamps
    end
  end
end
