require_relative 'Artist'
require_relative 'GEnre'

class Song
	attr_accessor :name, :artist, :genre
	@@all = []


	def initialize song_name, artist="unknown", genre="unknown"
		@name = song_name
		if genre == "unknown"
		   @genre = genre
		 else
		   self.genre = genre
		 end
		if artist == "unknown"
		  @artist = artist
		  #@genre = genre
		else
		  #self.genre = genre
		  self.artist = artist
		end		 
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
    if @artist != an_artist
	  @artist = an_artist
	  an_artist.add_song(self)
	end
  end
  
  def genre= a_genre
    if @genre != a_genre
	  @genre = a_genre
	  a_genre.add_song(self)
	end
  end

  # def artist
    # @artist
  # end

end

# genre = Genre.new("indie rock")
# artist = Artist.new("Neutral Milk Hotel")
# song = Song.new("In an Aeroplane Over the Sea", artist, genre)
# song = Song.new("Two Headed Boy pt 1", artist, genre)

# puts artist.genres
# puts song.genre
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