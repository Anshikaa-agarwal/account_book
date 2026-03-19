class CreateAccounts < ActiveRecord::Migration[8.1]
  def change
    create_table :accounts do |t|
      t.bigint     :number, null: false
      t.references :bank, null: false, foreign_key: true
      t.integer    :type, null: false
      t.numeric    :balance, null: false, default: 0

      t.timestamps
    end
  end
end
