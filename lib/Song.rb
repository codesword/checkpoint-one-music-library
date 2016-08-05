require_relative "artist"
require_relative "genre"

class Song
  attr_accessor :name, :artist, :genre

  @@all = []

  def initialize(song_name, artist = nil, genre = nil)
    @name = song_name
    @genre = genre if genre.instance_of?(Genre)
    @artist = artist if artist.instance_of?(Artist)
    self.artist = artist if artist
    self.genre = genre if genre
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

  def artist=(an_artist)
    @artist = an_artist if @artist != an_artist
    an_artist.add_song(self) unless an_artist.songs.include?(self)
  end

  def genre=(a_genre)
    @genre = a_genre if @genre != a_genre
    a_genre.add_song(self) unless a_genre.songs.include?(self)
  end

  def self.find_by_name(song_name)
    result = nil
    @@all.each {|song| result = song if song.name == song_name}
    result
  end

  def self.find_or_create_by_name(song_name)
    found = Song.find_by_name(song_name)
    if found
      found
    else
      Song.create(song_name)
    end
  end

  def self.new_from_filename(filename)
    song_name = filename.chomp(".mp3").split(" - ")
    genre = Genre.find_or_create_by_name(song_name[2])
    artist = Artist.find_or_create_by_name(song_name[0])
    song = Song.new(song_name[1], artist, genre)
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end
end
