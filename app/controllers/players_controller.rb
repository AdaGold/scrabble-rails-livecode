class PlayersController < ApplicationController
  def show
    @player = Player.find(params[:id])
  end

  def play
    @player = Player.find(params[:player_id])
    @player.play!(params[:word])
  rescue ArgumentError => e
    flash[:alert] = "Could not play word: #{e.message}"
  ensure
    redirect_to @player
  end
end
