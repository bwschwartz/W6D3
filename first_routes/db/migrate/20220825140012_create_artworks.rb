class CreateArtworks < ActiveRecord::Migration[7.0]
  def change
    create_table :artworks do |t|
      t.string :title, null: false, index: true
      t.string :image_url, null: false, unique: true
      t.integer :artist_id, null: false, index: true

      t.timestamps
    end

    add_index :artworks, [:title, :artist_id]
  end
end
