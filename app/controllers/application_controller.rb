class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/' do
    # get all the games from the database
    games = Game.all.order(:title).limit(10)
    games.to_json
  end

  get '/games/:id' do
    # look up the game in the database using its ID
    game = Game.find(params[:id])
    # send a JSON-formatted response of the game data
    game.to_json(include: { reviews: { include: :user } })
  end


end
