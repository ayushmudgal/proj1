class PokemonsController < ApplicationController
	def capture
		@id = params[:id]
		@pok = Pokemon.find @id 
		@pok.trainer = current_trainer
		@pok.save
		redirect_to root_path
	end

	def damage
		@id = params[:id]
		@pok = Pokemon.find @id
		@pok.health = @pok.health - 10
		@pok.save
		if @pok.health == 0
			@pok.destroy
		end
		redirect_to trainers_path current_trainer
	end

	def new 
		@pokemon = Pokemon.new
	end
	

	def create
		@pokemon = Pokemon.new(pokemon_params)
		@pokemon.trainer = current_trainer
		@pokemon.level = 1
		if @pokemon.save
			redirect_to trainers_path current_trainer
		else
			flash[:error] = @pokemon.errors	
			redirect_to new_pokemon_path
		end
	end

	private 
	def pokemon_params
		params.require(:pokemon).permit(:name)
	end
end
