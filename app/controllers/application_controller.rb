class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get '/leaderboards' do
    Score.all.sort{ |a,b| b.score <=> a.score}.to_json(include: :username)
  end

  get '/songs/:id' do
    Song.destroy_all

    scraper = Scraper.new
    songs = scraper.print_songs
    Song.create_from_collection(songs)

    Song.find(params[:id]).to_json
  end

  post '/players' do
    player = Username.create(name: params[:username])
    Score.create(score: 0, username_id: player.id)
    player.to_json
  end
end
