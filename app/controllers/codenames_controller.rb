class CodenamesController < ApplicationController

  def update
    @codename = Codename.find(params[:id])

    render :nothing => true
  end

  def mark
    @game = Game.find(params[:game_id])
    @codename = @game.codenames.where(n: params[:n])
    @codename.update(:known => 1)
  end
end
