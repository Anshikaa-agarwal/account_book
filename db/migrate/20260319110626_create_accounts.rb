class CreateAccounts < ActiveRecord::Migration[8.1]
  def change
    create_table :accounts do |t|
      t.string     :number
      t.references :bank, null: false, foreign_key: true
      t.integer    :type, null: false, default: 0
      t.decimal    :balance, precision: 10, scale: 3

      t.timestamps
    end
  end
end
