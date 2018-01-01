class CoffeeRoasters::CLI

  def call
    puts "Welcome to Coffee Roasters cli gem!"
    CoffeeRoasters::Scraper.new.scrape_roasters
  end

end
