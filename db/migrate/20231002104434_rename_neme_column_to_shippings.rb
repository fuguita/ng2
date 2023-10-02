class RenameNemeColumnToShippings < ActiveRecord::Migration[6.1]
  def change
    rename_column :shippings, :neme, :name
  end
end
