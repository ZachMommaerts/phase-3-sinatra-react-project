class Song < ActiveRecord::Base

    def self.create_from_collection(songs)
        songs.each do |song_hash|
            Song.create(song_hash)
        end
    end
    
end