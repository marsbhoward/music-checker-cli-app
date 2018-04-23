require_relative './movie.rb'
require_relative './stream.rb'

require 'nokogiri'
require 'open-uri'



class Scraper

  def get_netflix
    Nokogiri::HTML(open("http://collider.com/best-movies-on-netflix-streaming/"))
  end

  def get_hulu
    Nokogiri::HTML(open("http://collider.com/best-movies-on-hulu-streaming"))
  end

  def get_netflix_movies
    self.get_netflix.css(".slide")
  end

  def get_hulu_movies
    self.get_hulu.css(".slide")
  end

  def make_movies

    self.get_netflix_movies.each do |post|
      movie = Movie.new
      movie.title = post.first[1]
      movie.stream = "Netflix"
      Stream.new (movie.stream)
    end

    self.get_hulu_movies.each do |post|
      movie = Movie.new
      movie.title = post.first[1]
      movie.stream = "Hulu"
      Stream.new (movie.stream)
    end
  end

  def print_movies
    self.make_movies
    i = 0
    Movie.all.each do |movie|
      puts "Movie #{i}"
      if movie.title

        puts "  Title: #{movie.title}"
        puts "  stream: #{movie.stream}"
        i = i + 1
      end
    end
    Movie.all.clear
  end


  def print_netflix
    self.make_movies
    i = 0
    Movie.all.each do |movie|
      puts "Movie #{i}"
      if movie.stream == "Netflix"

        puts "  Title: #{movie.title}"
        puts "  stream: #{movie.stream}"
        i = i + 1
      end
    end
    Movie.all.clear
  end

  def print_hulu
    self.make_movies
    i = 0
    Movie.all.each do |movie|
      puts "Movie #{i}"

      if movie.stream == "Hulu"

        puts "  Title: #{movie.title}"
        puts "  stream: #{movie.stream}"
        i = i + 1
      end
    end
    Movie.all.clear
  end

  def print_streams
    self.make_movies

    streams = []
    Movie.all.each do |movie|
      if movie.title

        streams << movie.stream unless streams.include?(movie.stream)
      end
    end
    puts
    puts streams
    puts
  end
end
