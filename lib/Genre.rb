class Genre
  extend Concerns::Findable
	attr_accessor :name
	@@all = []


	def initialize genre_name
		@name = genre_name
		@songs = []
		@genre_artists = []
	end

	def self.all
		@@all
	end

	def save
		@@all.push(self)
	end

	def self.destroy_all
		@@all = []
	end

	def self.create(genre_name)
		genre = allocate
		genre.name = genre_name
		genre.save
		genre
	end

	def songs
	  @songs
	end

	def add_song song
      #@song = song.name
      puts "about to add #{song.artist}"
	  if song.genre != self
	    song.genre = self
	  end
	  if !(@songs.include?(song))
		@songs.push(song)
	  end
	  if !(@genre_artists.include?(song.artist))
	    @genre_artists.push(song.artist)
	  end
	end

	def artists
		@genre_artists
  end
end
