class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all.push(self)
    end

    def self.all
        return @@all
    end

    def songs
        return Song.all.select {|song| song.artist == self}
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        self.all.find {|artist| artist.name == name } ? self.all.find {|artist| artist.name == name } : self.new(name)
    end

    def print_songs
        songs.each do |song|
            puts song.name
        end
    end
        

end