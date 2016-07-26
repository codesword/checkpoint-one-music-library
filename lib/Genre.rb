class Genre
	attr_accessor :name
	@@all = []

	def initialize genre_name
		@name = genre_name
	end

	def self.all
		@@all
	end

	def save
		@@all.push(self)
	end

	def self.destroy_all
		@@all = []
	end

	def self.create(genre_name)
		genre = allocate
		genre.name = genre_name
		genre.save
		genre
	end
end

genre = Genre.new("In an Aeroplane Over the Sea")
puts "name of genre is #{genre.name}"
genre.name = "Jump Around"
puts "name of genre is #{genre.name}"
puts "contents of library: #{Genre.all}"
genre.save
puts "contents of library: #{Genre.all}"
Genre.destroy_all
puts "contents of library: #{Genre.all}"
genre = Genre.create("In an Aeroplane Over the Sea")
puts genre
puts "name of genre is #{genre.name}"
puts "contents of library: #{Genre.all}"