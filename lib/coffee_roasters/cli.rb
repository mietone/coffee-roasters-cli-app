class CoffeeRoasters::CLI

  def call
    puts ""
    puts "Welcome to Coffee Roasters cli gem!"
    puts ""
    CoffeeRoasters::Scraper.new.scrape_roasters
    list_roasters(1)
    menu
  end

  def menu
    input = nil
    while input != 'exit'
      puts "Enter the number of the coffee roaster you'd like more info on:"
      puts "Or type 'A', 'B', 'C', or 'D' for the list - A: 1-5, B: 6-10, C: 11-15, D: 16-21"
      puts "Or type 'exit'."

      input = gets.strip.downcase

      if input.to_i.between?(1, 21)
        roaster_detail(input.to_i-1)
      elsif input == "a"
        list_roasters(1)
      elsif input == "b"
        list_roasters(6)
      elsif input == "c"
        list_roasters(11)
      elsif input == "d"
        list_roasters(16)
      elsif input == "exit"
        goodbye
      else
        puts "invalid input."
      end

    end
  end


  def list_roasters(from_number)
    @roaster = CoffeeRoasters::Roaster.all
    if from_number == 16
      @roaster[from_number-1, 6].each.with_index(from_number) do |roaster, index|
        puts "#{index}. #{roaster.name} - #{roaster.location}"
        puts "#{roaster.bean}"
        puts ""
      end
    else
      @roaster[from_number-1, 5].each.with_index(from_number) do |roaster, index|
        puts "#{index}. #{roaster.name} - #{roaster.location}"
        puts "#{roaster.bean}"
        puts ""
      end
    end
  end

  def roaster_detail(num)
    @roaster = CoffeeRoasters::Roaster.all
    the_roaster = @roaster[num]

    puts "#{the_roaster.name} - #{the_roaster.location}"
    puts "#{the_roaster.bean}"
    puts ""
    puts "#{the_roaster.details}"
    puts ""

    menu
  end

  def goodbye
    "Thanks for visiting! Enjoy your coffee!"
    exit
  end

end
