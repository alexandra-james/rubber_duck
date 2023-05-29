class CreateDucks < ActiveRecord::Migration[7.0]
  def change
    create_table :ducks do |t|
      t.string :name
      t.string :description
      t.string :language
      t.references :user, null: false, foreign_key: true
      t.string :image_url
      t.integer :price

      t.timestamps
    end
  end
end
