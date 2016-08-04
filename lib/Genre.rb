class Genre
  extend Concerns::Findable
  attr_accessor :name
  attr_reader :songs
  @@all = []

  def initialize(genre_name)
    @name = genre_name
    @songs = []
    @genre_artists = []
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

  def self.create(genre_name)
    genre = Genre.new(genre_name)
    genre.save
    genre
  end

  def add_song(song)
    song.genre = self if song.genre != self
    @songs.push(song)
    @genre_artists.push(song.artist) if !(@genre_artists.include?song.artist)
  end

  def artists
    @genre_artists
  end
end
