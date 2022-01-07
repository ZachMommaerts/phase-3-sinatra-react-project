require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './billboard_top_100.rb'
# require_relative '../models/song.rb'

class Scraper

    def get_webpage
        doc = Nokogiri::HTML(open("https://www.billboard.com/charts/hot-100/"))
        
    end

    def top100_tracks
        self.get_webpage.css(".o-chart-results-list-row-container")
    end

    def create_songs
        self.top100_tracks.each do |music|
            song = BillboardTop100.new
            song.songname = music.css("h3").first.text.strip
            song.artist = music.css(".c-label.a-no-trucate").text.strip
            song.currentposition = music.css(".c-label")[0].text.strip
        end
    end

    def print_songs
        songs = []
        self.create_songs
        BillboardTop100.all.each do |song|
            if song.songname && song.songname != ""
                song_info = {
                    songname: song.songname,
                    artist: song.artist,
                    currentposition: song.currentposition
            }

                songs << song_info
            end
        end

        songs
    end
end

Scraper.new.print_songs