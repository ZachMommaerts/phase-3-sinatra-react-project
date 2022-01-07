class BillboardTop100
    attr_accessor :songname, :artist, :currentposition, :image
    @@all = []

    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

    def self.reset_all
        @@all.clear
    end
    
end
