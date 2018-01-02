class CoffeeRoasters::CLI

  def call
    puts "Welcome to Coffee Roasters cli gem!"
    CoffeeRoasters::Scraper.new.scrape_roasters
    list_roasters
  end

  def list_roasters
    
  end

end
