class CreateTransactions < ActiveRecord::Migration[8.1]
  def change
    create_table :transactions do |t|
      t.references :title, foreign_key: true
      t.datetime   :date_time, null: false
      t.decimal    :amount,  precision: 7,  scale: 2, null: false
      t.decimal    :balance, precision: 10, scale: 2, null: false, default: 0
      t.integer    :type,    null: false
      t.references :account, null: false, foreign_key: true

      t.timestamps
    end
  end
end
