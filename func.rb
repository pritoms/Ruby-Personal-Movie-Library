require 'yaml'

module Func

	def write(movie_name)
	  movie_db = "movies.yml"
	    File.open(movie_db, 'w') do |file|
	    movie_name.each{ |k, v| file << ("\n #{k}: #{v}\n") }
	  end
	end

	def add()
	  movie = {}
	  YAML.load(File.read("movies.yml")).each do |x, y| movie[x] = y end

	  puts "What movie would you like to add? "
	  title = gets.chomp
	  
	  puts "What rating does the movie have? "
	  rating = gets.chomp
	    
	  if movie[title] == nil && title != ""
	    movie[title] = rating
	    write(movie)

	    puts "#{title} has been added!\n"
	  else
	    puts "This movie is already in\n"
	  end
	end


	def update()
	  movie = {}
	  YAML.load(File.read("movies.yml")).each do |x, y| movie[x] = y end

	  puts "Which movie would you like to update? "
	  title = gets.chomp
	  
	  if movie[title] == nil
	    puts "This title doesn't exist"
	  else
	    puts "How would you rate now?"
	    rating = gets.chomp

	    temp = movie[title]

	    movie[title] = rating
	    write(movie)
	    puts "Rating for #{title} is changed from #{temp} to #{rating}."

	  end
	end

	def display()
	  movie = {}
	  YAML.load(File.read("movies.yml")).each do |x, y| movie[x] = y end

	  puts "You have #{movie.size} movies in your list: \n\n"

	  movie.each do |title, rating|
	    puts "#{title}: #{rating}"
	    puts "* * * * * * * * * * * *"
	  end
	end

	def delete()
	  movie = {}
	  YAML.load(File.read("movies.yml")).each do |x, y| movie[x] = y end

	  puts "Which movie you want to delete?"
	  title = gets.chomp
	  
	  if movie[title] == nil
	    puts "This title doesn't exist"
	  else
	    movie.delete(title)
	    write(movie)
	    puts "#{title} is removed from your list."
	  end
	end
end