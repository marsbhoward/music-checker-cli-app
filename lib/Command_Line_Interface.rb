class CommandLineInterface


	def call
		input = ""


		puts "Welcome to Movie Checker!"
		while input != "exit"
			puts "Main Menu"
			puts "To see all movies currently streaming enter 'list movies'."
			puts "To see all movies currently streaming on Netflix enter 'netflix'."
			puts "To see all movies currently streaming on Hulu enter 'hulu'."
			puts "to see the list of streaming services type 'list streams'"
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
					Scraper.new.print_hulu
				when "list streams"
					Scraper.new.print_streams
			end
		end
	end
end
