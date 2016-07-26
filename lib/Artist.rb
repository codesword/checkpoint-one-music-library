require_relative 'Song'

class Artist
	attr_accessor :name, :song

	@@all = []
	@@songs = []

	def initialize artist_name, song_name="unknown"
		@name = artist_name
		@song = song_name
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

	def self.create(artist_name)
		artist = allocate
		artist.name = artist_name
		artist.save
		artist
	end

	def songs
		@@songs
	end

	def add_song song
    @song = song.name
		if !(@@songs.include?(song))
			@@songs.push(song)
		end
	end
end

song = Song.new("In an Aeroplane Over the Sea")
artist = Artist.new("Neutral Milk Hotel")
artist.add_song(song)

puts song.artist
puts artist