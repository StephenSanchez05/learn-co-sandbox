require_relative './scraper.rb'

class UI 
  
  def start
    Scraper.new.get_oscar_winners
    puts "Welcome to the Oscars"
    intro
  end
   
   
   def intro
    puts ""
    puts "Would you like to see all the winners or a specific category? (all/category)"
    input = gets.strip
    
    if input == "all"
      Scraper.new.print_oscar
      elsif input == "category"
      category
    else 
      puts "I'm sorry I don't understand, enter 'all' or 'category'"
      intro
    end
  end 
  
  def category
    puts ""
    puts "Would you like to see the list of categories?  (y/n)"
    input = gets.strip.downcase
    if input == "y"
      Scraper.new.oscar_list
      selection
      elsif input == "n"
      selection
    else 
      puts ""
      puts "Please answer 'y' or 'n'"
      category
    end
  end 
  
  def selection
    puts ""
    puts "Please enter the number of the category you would like to see (1-24)"
    input = gets.strip.to_i
    if input.is_a?(Integer)
    Scraper.new.specific_oscar(input)
    else
    selection
    end
  end
end
    
    
UI.new.start