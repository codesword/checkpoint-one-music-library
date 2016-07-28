#require_relative 'Song'

class Artist
  extend Concerns::Findable
  attr_accessor :name, :song

  @@all = []
  

  def initialize artist_name, song_name=nil
    @name = artist_name
    @song = song_name
    @songs = []
    @song_genres = []

  end

  def self.all
    @@all
  end

  def save
    if !(@@all.include?(self))
      @@all.push(self)
    end
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
    @songs
  end

  def add_song song
    @song = song.name
    save
    if song.artist != self
      song.artist = self
    end
    if !(@songs.include?(song))
    @songs.push(song)
    end
    if !(@song_genres.include?(song.genre))
      @song_genres.push(song.genre)
    end
  end

  def genres
    @song_genres
  end

end