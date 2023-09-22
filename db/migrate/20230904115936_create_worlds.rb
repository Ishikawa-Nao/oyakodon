class CreateWorlds < ActiveRecord::Migration[6.1]
  def change
    create_table :worlds do |t|
      t.string :name
      t.string :genre
      t.string :area
      t.string :time
      t.string :address
      t.text :about
      t.integer :lat
      t.integer :lng

      t.timestamps
    end
  end
end
