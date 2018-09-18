class CreateTaxes < ActiveRecord::Migration[5.2]
  def change
    create_table :taxes do |t|
      t.string :name
      t.integer :tax_code
      t.float :amount
      t.float :tax_amount
      t.float :total_amount

      t.timestamps
    end

    add_index :taxes, %i[name tax_code], unique: true
  end
end
