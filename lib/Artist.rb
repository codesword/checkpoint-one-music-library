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

# song = Song.new("In an Aeroplane Over the Sea")
# artist = Artist.new("Neutral Milk Hotel")
# song.artist = artist
# puts "this artist sang: #{artist.songs}"

# artist = Artist.new("In an Aeroplane Over the Sea")
# puts "name of artist is #{artist.name}"
# artist.name = "Jump Around"
# puts "name of artist is #{artist.name}"
# puts "contents of library: #{Artist.all}"
# artist.save
# puts "contents of library: #{Artist.all}"
# Artist.destroy_all
# puts "contents of library: #{Artist.all}"
# artist = Artist.create("In an Aeroplane Over the Sea")
# puts artist
# puts "name of artist is #{artist.name}"
# puts "contents of library: #{Artist.all}"