class CoffeeRoasters::Scraper

  def scrape_roasters
    doc = Nokogiri::HTML(open("https://www.thrillist.com/drink/nation/the-21-best-coffee-roasters-in-the-country"))
# binding.pry

    section = doc.css("section.save-venue")
    
    roaster = CoffeeRoasters::Roaster.new

    roaster.name = doc.css("section.save-venue a.save-venue__link").text
    roaster.location = doc.css("h2.save-venue__neighborhood").text
    roaster.bean = doc.css("p.save-venue__description").text.split("\n")[0]
    roaster.details = doc.css("p.save-venue__description").text.split("\n")[2]
    roaster.url = doc.css("a.save-venue__link").attr("href").value

    roaster.save
  end

end
