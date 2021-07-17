class CreateLists < ActiveRecord::Migration[6.1]
  def change
    create_table :lists do |t|
      t.text :genere

      t.timestamps
    end
  end
end
