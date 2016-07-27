class MusicImporter
  attr_reader :path

  def initialize path_name
    @path = path_name
    @files = []
  end

  def files
    Dir.foreach(@path) do |file|
      next if file == '.' || file == ".."
      @files.push(file)
    end
    @files
    #return list of files
  end

  def self.import
    
    #import all files and create song objects
  end
end