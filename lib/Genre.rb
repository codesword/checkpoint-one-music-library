class Genre
	attr_accessor :name
	@@all = []
	@@songs = []

	def initialize genre_name
		@name = genre_name
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
	  @@songs
	end
	
	def add_song song
      @song = song.name
	  if song.genre != self
	    song.genre = self
	  end
	  if !(@@songs.include?(song))
		@@songs.push(song)
	  end
	end
	
end

