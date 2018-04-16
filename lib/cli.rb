class CLI
	input = ""

	puts "Welcome to Movie Checker!"
	while input != "exit"
		puts "To see all movies currently streaming enter 'list movies'."
		puts "To see all movies currently streaming on Netflix enter 'netflix'."
		puts "To see all movies currently streaming on Hulu enter 'hulu'."
		puts "To quit enter 'exit'."
		puts
		puts "What would you like to do?"

		input = gets.strip



		case input
			when "list movies"
				Scraper.new.print_movies
			when "netflix"
				Scraper.new.print_netflix
			when "hulu"
				Scraper.new.print_movies
		end
	end
end
