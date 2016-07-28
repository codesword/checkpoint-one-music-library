class MusicLibraryController
  def initialize path = "./db/mp3s"
    control = MusicImporter.new(path)
    control.import
  end

  def call
  	command = gets.chomp
  end
end