class Movie
  attr_accessor :title
  attr_accessor :source, :genre

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
