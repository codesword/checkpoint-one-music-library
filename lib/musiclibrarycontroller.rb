require_relative "message"

class MusicLibraryController
  def initialize(path = "./db/mp3s")
    @control = MusicImporter.new(path)
    @control.import
    @menu = {
      "list songs" => :list_songs,
      "list artists" => :list_artists,
      "list genres" => :list_genres,
      "play song" => :play_song,
      "list artist" => :list_artist,
      "list genre" => :list_genre,
      "help" => :list_commands
    }
  end

  def call
    Message.intro
    command = gets.chomp.downcase
    run_command(command)
  end

  def run_command(command)
    if @menu.keys.include?(command)
      send(@menu[command])
      call
    elsif command != "exit"
      Message.invalid
      call
    else
      return
    end
  end

  def list_songs
    @control.files.each.with_index(1) do |file, index|
      puts "#{index}. #{file.chomp('.mp3')}"
    end
  end

  def list_artists
    Artist.all.each {|item| puts item.name}
  end

  def list_genres
    Genre.all.each {|item| puts item.name}
  end

  def play_song
    size = @control.files.length
    Message.what_song(size)
    index = gets.chomp.to_i

    if index < 1 || index > size
      Message.invalid_song
    else
      Message.playing(@control.files[index - 1].chomp(".mp3"))
    end
  end

  def list_artist
    result = Artist.find_by_name(get_name("artist"))

    if result
      result.songs.each do |song|
        result.genres.each do |genre|
          Message.song_name(result.name, song.name, genre.name)
        end
      end
    else
      Message.not_found(Artist)
    end
  end

  def list_genre
    result = Genre.find_by_name(get_name("genre"))

    if result
      result.songs.each do |song|
        result.artists.each do |artists|
          Message.song_name(artists.name, song.name, result.name)
        end
      end
    else
      Message.not_found(Genre)
    end
  end

  def get_name(name)
    Message.get_name(name)
    name = gets.chomp
    name
  end

  def list_commands
    Message.list_commands
  end
end
