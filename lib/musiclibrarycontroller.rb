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
    puts " "
    puts "Welcome to the Music Library"
    puts "What would you like to do? Enter a command"
    puts "(type help to get a list of valid commands)"
    command = gets.chomp.downcase
    run_command(command)
  end

  def run_command(command)
    if @menu.keys.include?(command)
      send(@menu[command])
      call
    elsif command != "exit"
      puts "Invalid Command"
      call
    else
      return
    end
  end

  def list_songs
    i = 1
    @control.files.each do |file|
      puts "#{i}. #{file.chomp(".mp3")}"
      i += 1
    end
  end

  def list_artists
    Artist.all.each do |item|
      puts item.name
    end
  end

  def list_genres
    Genre.all.each do |item|
      puts item.name
    end
  end

  def play_song
    size = @control.files.length
    puts "What song number would like to play? (1 - #{size})"
    index = gets.chomp.to_i

    if index < 1 || index > size
      puts "Invalid song number"
    else
      puts "Playing #{@control.files[index - 1].chomp(".mp3")}"
    end
  end

  def list_artist
    result = Artist.find_by_name(get_name("artist"))

    if result
      result.songs.each do |song|
        result.genres.each do |genre|
          puts "#{result.name} - #{song.name} - #{genre.name}"
        end
      end
    else
      puts "Artist not found"
    end
  end

  def get_name(name)
    puts "Enter the #{name} name to search for: "
    name = gets.chomp
    name
  end

  def list_genre
    result = Genre.find_by_name(get_name("genre"))

    if result
      result.songs.each do |song|
        result.artists.each do |artists|
          puts "#{artists.name} - #{song.name} - #{result.name}"
        end
      end
    else
      puts "Genre not found"
    end
  end

  def list_commands
    puts "Commands:"
    puts "1.) 'list songs' lists all songs"
    puts "2.) 'list artists' lists all artists"
    puts "3.) 'list genres' lists all genres"
    puts "4.) 'play song' plays specified song"
    puts "5.) 'list artist' lists an artist's songs"
    puts "6.) 'list genre' lists a genre's songs"
    puts "7.) 'help' lists the commands"
    puts "8.) 'exit' closes the music library"
  end
end
