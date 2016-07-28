require_relative 'Song'

class MusicImporter
  attr_reader :path

  def initialize path_name
    @path = path_name
    @files = []
    #self.files
  end

  def files
    Dir.foreach(@path) do |file|
      #next if file == '.' || file == ".."
      next if File.directory? file || file =~ /^\.\S*/
      @files.push(file)
    end
    @files
    end

  def import
    @files.each do |file|
      song = Song.create_from_filename(file)
    end
  end
end

# test_music_path = "./spec/fixtures/mp3s"
# music_importer = MusicImporter.new(test_music_path)
# music_importer.import

# puts Song.all

# puts "song size: #{Song.all.size}"
# puts "artist size: #{Artist.all.size}"
# puts "#{Genre.all.size}"

#puts "green aisles artist name: #{Song.find_by_name("Green Aisles").artist.name}" #=> Real Estate
# puts "green aisles songs: #{Song.find_by_name("Green Aisles").artist.songs.size}" #=> 2