class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    Song.destroy_all
    scraper = Scraper.new
    songs = scraper.print_songs
    Song.create_from_collection(songs)
  
    Song.all.to_json
  end

  get '/leaderboards' do
    Score.all.sort{ |a,b| b.score <=> a.score}.to_json(include: :username)
  end

  get '/random_song' do
    Song.all.sample.to_json
  end

  post '/players' do
    player = Username.where(name: params[:username]).first_or_create
    Score.create(score: 0, username_id: player.id)
    player.to_json
  end
end
