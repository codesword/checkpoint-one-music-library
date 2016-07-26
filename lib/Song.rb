#require_relative 'Artist'

class Song
	attr_accessor :name
	@@all = []


	def initialize song_name, artist="unknown"
		@name = song_name
		@artist = artist
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

	def self.create(song_name)
		song = allocate
		song.name = song_name
		song.save
		song
	end

  def artist= an_artist
    puts "i got here"
    @artist = an_artist
    puts @artist
    an_artist.add_song(self)
  end

  def artist
    @artist
  end

end

# song = Song.new("In an Aeroplane Over the Sea")
# puts "name of song is #{song.name}"
# song.name = "Jump Around"
# puts "name of song is #{song.name}"
# puts "contents of library: #{Song.all}"
# song.save
# puts "contents of library: #{Song.all}"
# Song.destroy_all
# puts "contents of library: #{Song.all}"
# song = Song.create("In an Aeroplane Over the Sea")
# puts song
# puts "name of song is #{song.name}"
# puts "contents of library: #{Song.all}"