class AddReleasedToSongs < ActiveRecord::Migration[5.0]
  def change
    add_column :songs, :released, :boolean, default: false
  end
end
