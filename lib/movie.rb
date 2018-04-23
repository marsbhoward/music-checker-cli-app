class Movie
  require_relative './stream.rb'
  attr_accessor :title
  attr_accessor :stream, :genre

  @@all = []

  def initialize
   @@all << self
  end

  def self.all
    @@all
  end

  def self.reset_all
    @@all.clear
  end
end
