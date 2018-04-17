class PlayersController < ApplicationController
  def show
    @player = Player.find(params[:id])
  end

  def play
    @player = Player.find(params[:player_id])
    @player.play!(params[:word])

    redirect_to @player
  end
end
