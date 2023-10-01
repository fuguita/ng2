class CreateShippings < ActiveRecord::Migration[6.1]
  def change
    create_table :shippings do |t|
      t.integer :customer_id
      t.string :neme
      t.string :address
      t.string :postal_code
      t.timestamps
    end
  end
end
