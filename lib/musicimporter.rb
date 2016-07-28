require_relative 'Song'

class MusicImporter
  attr_reader :path

  def initialize path_name
    @path = path_name
    @files = []
    self.files
  end

  def files
    Dir.foreach(@path) do |file|
      # file = file.chomp("mp3")
      #next if file == '.' || file == ".."
      next if File.directory? file || file =~ /^\.\S*/
      @files.push(file) unless @files.include?(file)
    end
    @files
    end

  def import
    @files.each do |file|
      song = Song.create_from_filename(file)
    end
  end
end