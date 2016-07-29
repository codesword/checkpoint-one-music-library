class MusicLibraryController
  def initialize path = "./db/mp3s"
    @control = MusicImporter.new(path)
    @control.import
  end

  def call 
    command = " "

    while command != "exit"
      puts " "
      puts "Welcome to the Music Library"
      puts "What would you like to do? Enter a command"
      puts "(type help to get a list of valid commands)"
      command = gets.chomp.downcase

      puts case command
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres 
      when "play song"
        play_song
      when "list artist"
        list_artist
      when "list genre"
        list_genre
      when "help"
        list_commands
      else
        puts "Invalid command"
      end
    end
  end

  def list_songs
    i = 1
    result = []

    @control.files.each do |file|
        result.push("#{i}. #{file.chomp(".mp3")}")
        i += 1
    end

    result
  end

  def list_artists
    result = []

    Artist.all.each do |item|
      result.push(item.name)
    end
    result
  end

  def list_genres
    result = []

    Genre.all.each do |item|
      result.push(item.name)
    end

    result
  end

  def play_song
    puts "What song number would like to play? (1 - #{@control.files.length})"
    index = gets.chomp.to_i

    if index < 1 || index > @control.files.length 
      puts "Invalid song number"
    else
      "Playing #{@control.files[index - 1].chomp(".mp3")}"
    end
  end

  def list_artist
    puts "Enter the name to search for: "
    name = gets.chomp
    result = Artist.find_by_name(name)

    if result != nil
      result.songs.each do |song|
        result.genres.each do |genre|
        puts "#{result.name} - #{song.name} - #{genre.name}"
        end
      end
    else
      puts "Artist not found"
    end
  end

  def list_genre
    puts "Enter the name to search for: "
    name = gets.chomp
    result = Genre.find_by_name(name)

    if result != nil
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
