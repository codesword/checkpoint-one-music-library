require_relative 'Artist'
require_relative 'Genre'

class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  # def initialize song_name, artist="unknown", genre="unknown"
  #   @name = song_name

  #   if artist == "unknown"
  #     @artist = artist
  #     #@genre = genre
  #   else
  #     #self.genre = genre
  #     self.artist = artist
  #   end
 #    if genre == "unknown"
 #       @genre = genre
 #     else
 #       self.genre = genre
 #     end
  # end

  def initialize song_name, artist=nil, genre=nil
    @name = song_name
    @artist = artist if artist.instance_of? (Artist)
    @genre = genre if genre.instance_of? (Genre)
    # artist.add_song(self)
    # genre.add_song(self)
    self.genre = genre
    self.artist = artist
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
    #self.genre = genre
    if @artist != an_artist
      @artist = an_artist
      puts self.genre
      an_artist.add_song(self)
    end
  end

  def genre= a_genre
    if @genre != a_genre
      @genre = a_genre
      a_genre.add_song(self)
    end
  end

  def self.find_by_name song_name
    result = nil
    @@all.each do |song|
      if song.name == song_name
        result = song
      end
    end
    result
  end

  def self.find_or_create_by_name song_name
    if Song.find_by_name(song_name)
      return Song.find_by_name(song_name)
    else
      Song.create(song_name)
    end
  end
end

# genre = Genre.new("indie rock")

#       neutral_milk_hotel = Artist.new("Neutral Milk Hotel")
#       the_magnetic_fields = Artist.new("The Magnetic Fields")

#       Song.new("In an Aeroplane Over the Sea", neutral_milk_hotel, genre)
#       Song.new("The Book of Love", the_magnetic_fields, genre)
#       Song.new("Papa was a Rodeo", the_magnetic_fields, genre)

#       puts genre.artists
#       puts genre.artists.size