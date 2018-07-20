class GamesController < ApplicationController
  
  def index
    @games = Game.all
  end

  def new
    @game = Game.new
  end

  def show_to_captain
    @game = Game.find(params[:id])
    if params[:keyword]==@game.password
      render :showcap
    else
      render :show
    end
  end

  def show
    @game = Game.find(params[:id])
  end

  def create
    n = 25
    @game = Game.new(game_params)
    words = params[:game][:text].split
    teams = ([0]*7+[1]*8+[2]*8+[rand(2)]+[3]).shuffle
    @game.save
    i = 0
    n.times { @game.codenames.create({  :team => teams[i],
                                        :n => i+=1,
                                        :word => words.delete(words[rand(words.length)]),
                                        :known => 0,
                                     }) }
    redirect_to @game
  end

  private
    def game_params
      params.require(:game).permit(:password)
    end

end
