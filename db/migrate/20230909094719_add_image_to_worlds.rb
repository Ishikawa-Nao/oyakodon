class AddImageToWorlds < ActiveRecord::Migration[6.1]
  def change
    add_column :worlds, :image, :string
  end
end
