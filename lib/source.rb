class Source
    extend Concerns :: Findable

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
    source = new(name)
    source.save
    source
  end

  def add_movie(movie)
    movie.source = self unless movie.source
    movies << movie unless moviess.include?(movie)
  end

  def genres
    movies.collect{ |s| s.genre }.uniq
  end
end

end
