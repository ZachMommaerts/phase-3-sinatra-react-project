class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    Song.destroy_all

    scraper = Scraper.new
    songs = scraper.print_songs
    Song.create_from_collection(songs)
  end

  get '/leaderboards' do
    Score.all.sort{ |a,b| b.score <=> a.score}.to_json(include: :username)
  end

  get '/random_song' do
    Song.all.rawQuery("SELECT * FROM songs ORDER BY RANDOM() LIMIT 1", null);
  end

  post '/players' do
    player = Username.where(name: params[:username]).first_or_create
    Score.create(score: 0, username_id: player.id)
    player.to_json
  end
end
