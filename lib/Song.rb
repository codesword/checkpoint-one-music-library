require_relative "Artist"
require_relative "Genre"

class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize song_name, artist=nil, genre=nil
    @name = song_name
    @genre = genre if genre.instance_of?(Genre)
    @artist = artist if artist.instance_of?(Artist)
    self.artist = artist if artist != nil
    self.genre = genre if genre != nil
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all = []
  end

  def save
    @@all.push(self)
  end
  
  def self.create(song_name)
    song = Song.new(song_name)
    song.save
    song
  end

  def artist= an_artist
    if @artist != an_artist
      @artist = an_artist
    end

    if !(an_artist.songs.include?(self)) 
      an_artist.add_song(self)
    end
  end

  def genre= a_genre
    if @genre != a_genre
      @genre = a_genre
    end

    if !(a_genre.songs.include?(self))
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
      Song.find_by_name(song_name)
    else
      Song.create(song_name)
    end
  end

  def self.new_from_filename filename
    name = filename.chomp(".mp3").split(" - ")
    genre = Genre.find_or_create_by_name(name[2])
    artist = Artist.find_or_create_by_name(name[0])
    song = Song.new(name[1], artist, genre)
    song
  end

  def self.create_from_filename filename
    song = Song.new_from_filename(filename)
    song.save
    song
  end
end