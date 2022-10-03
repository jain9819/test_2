class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :likeable_id, index: true
      t.string :likeable_type, index: true
      t.integer :like_count

      t.timestamps
    end
  end
end
