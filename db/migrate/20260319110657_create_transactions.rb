class CreateTransactions < ActiveRecord::Migration[8.1]
  def change
    create_table :transactions do |t|
      t.string :title
      t.string :date
      t.decimal :amount
      t.integer :type
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
