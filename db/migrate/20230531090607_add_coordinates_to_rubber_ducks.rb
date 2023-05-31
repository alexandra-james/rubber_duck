class AddCoordinatesToRubberDucks < ActiveRecord::Migration[7.0]
  def change
    add_column :ducks, :latitude, :float
    add_column :ducks, :longitude, :float
  end
end
