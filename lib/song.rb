class Song
    
    attr_accessor :name, :artist, :artist_name

    @@all = []

    def initialize(name)
        @name = name
        @@all.push(self)
    end

    def self.all
        return @@all
    end

    def self.new_by_filename(filename)
        filename_split = filename.split(" - ")
        artist = filename_split[0]
        song = filename_split[1]

        new_song = self.new(song)
        new_song.artist = Artist.find_or_create_by_name(artist)

        return new_song
    end

    def artist_name=(artist)
        self.artist = Artist.find_or_create_by_name(artist)
    end

end