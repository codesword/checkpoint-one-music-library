require_relative 'Song'

class MusicLibraryController
  def initialize path = "./db/mp3s"
    @control = MusicImporter.new(path)
    @control.import
  end

  def call *command
    puts "Welcome to the Music Library"
    puts "What would you like to do? (enter the appropriate command)"
    user_response = gets.chomp.downcase
    return "list songs"
    puts "#{list_songs}"
    
  end

  def list_songs
  i = 1
    @control.files.each do |item|
      puts "#{i}. #{item}"
      i = i + 1
    end
  end
end