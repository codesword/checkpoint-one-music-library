require_relative 'Artist'
require_relative 'Genre'

class Song
  attr_accessor :name, :artist, :genre
  @@all = []

  def initialize song_name, artist=nil, genre=nil
    @name = song_name

    @artist = artist #if artist.instance_of?(Artist)
    @genre = genre #if genre.instance_of?(Genre)
    artist.add_song(self) if @artist != nil
    genre.add_song(self) if @genre != nil

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

  def self.new_from_filename filename
    name = filename.chomp(".mp3").split(" - ")
    genre = Genre.new(name[2] )
    artist = Artist.new(name[0])
    song = Song.new(name[1], artist, genre)
    song
  end

  def self.create_from_filename filename
    song = Song.new_from_filename(filename)
    song.save
    song
  end
end

song = Song.create_from_filename("Thundercat - For Love I Come - dance.mp3")


puts "song: #{song}"
puts "is it same? #{Song.find_by_name("For Love I Come")}"
puts ""
puts "artist: #{song.artist}"
puts "is it same? #{Artist.find_by_name("Thundercat")}"
puts ""
puts "genre: #{song.genre}"
puts "is it same? #{Genre.find_by_name("dance")}"

