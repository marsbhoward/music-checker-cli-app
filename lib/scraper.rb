require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative './movie.rb'

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
      movie.source = "Netflix"
    end
    self.get_hulu_movies.each do |post|
      movie = Movie.new
      movie.title = post.first[1]
      movie.source = "Hulu"
    end
  end

  def print_movies
    self.make_movies
    Movie.all.each do |movie|
      puts Movie
      if movie.title

        puts "Title: #{movie.title}"
        puts "  Source: #{movie.source}"
      end
    end
  end


  def print_netflix
    self.make_movies
    Movie.all.each do |movie|
      puts Movie
      if movie.source = "Netflix"

        puts "Title: #{movie.title}"
        puts "  Source: #{movie.source}"
      end
    end
  end

  def print_hulu
    self.make_movies
    Movie.all.each do |movie|
      puts Movie
      if movie.source = "Hulu"

        puts "Title: #{movie.title}"
        puts "  Source: #{movie.source}"
      end
    end
  end
end
#Scraper.new.print_movies
