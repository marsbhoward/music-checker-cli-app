class Stream
  require_relative './movie.rb'

       extend Concerns::Findable


    attr_accessor :name
    attr_reader :movies

    @@all = []

  def initialize(name)
    @name = name
    @movies = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    all.clear
  end

  def save
    self.class.all << self
  end

  def self.create(name)
    stream = new(name)
    stream.save
    stream
  end

  def add_movie(movie)
    movie.stream = self unless movie.stream
    movies << movie unless moviess.include?(movie)
  end

  def genres
    movies.collect{ |s| s.genre }.uniq
  end
end
