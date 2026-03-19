class CreateTransaction < ActiveRecord::Migration[8.1]
  def change
    create_table :transactions do |t|
      t.references :title, foreign_key: true
      t.string :date
      t.decimal :amount, precision: 8, scale: 3
      t.integer :type
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
