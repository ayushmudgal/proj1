class AddHealthToPokemons < ActiveRecord::Migration
  def change
    add_column :pokemons, :health, :integer, default:100
  end
end
