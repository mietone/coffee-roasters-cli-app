class CoffeeRoasters::Roaster
  attr_accessor :name, :location, :bean, :details, :url

  @@all = []

  def self.all
    @@all
  end

  def save
    @@all << self
  end

end
