require_relative "Song"

class MusicImporter
  attr_reader :path

  def initialize path_name
    @path = path_name
    @files = []
    self.build_library
  end

  def build_library
    Dir.foreach(@path) do |file|
    next if File.directory? file || file =~ /^\.\S*/
      @files.push(file) if !(@files.include?(file))
    end

  end

  def files
    @files
  end

  def import
    @files.each do |file|
      song = Song.create_from_filename(file)
    end
  end
end