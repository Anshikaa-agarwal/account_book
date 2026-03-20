class CreateTitles < ActiveRecord::Migration[8.1]
  def change
    create_table :titles do |t|
      t.string :name

      t.timestamps
    end
  end
end
