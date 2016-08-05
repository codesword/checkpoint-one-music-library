require_relative "song"

class MusicImporter
  attr_reader :path, :files

  def initialize(path_name)
    @path = path_name
    @files = []
    build_library
  end

  def build_library
    Dir.foreach(@path) do |file|
      next if File.directory? file
      @files.push(file) unless @files.include?(file)
    end
  end

  def import
    @files.each {|file| Song.create_from_filename(file)}
  end
end
