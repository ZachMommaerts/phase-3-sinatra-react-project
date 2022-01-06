require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './billboard_top_100.rb'

class Scraper

    def get_webpage
        doc = Nokogiri::HTML(open("https://www.billboard.com/charts/hot-100/"))
        
    end

    def top100_tracks
        self.get_webpage.css(".o-chart-results-list-row-container")
        # self.get_webpage.css(".o-chart-results-list__item")
    end

    def create_songs
        self.top100_tracks.each do |music|
            song = BillboardTop100.new
            song.songname = music.css("h3").first.text
            song.artist = music.css(".c-label")[1].text
            song.currentposition = music.css(".c-label")[0].text
        end
    end

    def print_songs
        self.create_songs
        BillboardTop100.all.each do |song|
            if song.songname && song.songname != ""
                Song.create(
                    song: song.songname,
                    artist: song.artist,
                    currentposition: song.currentposition
                )
                # puts "Song: #{song.songname}"
                # puts "Artist: #{song.artist}"
                # puts "Currentposition: #{song.currentposition}" 
            end
        end
    end
end

Scraper.new.print_songs