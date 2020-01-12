require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative './oscar_winner.rb'

class Scraper
  
  def get_oscar
    Nokogiri::HTML(open("https://www.oscars.org/oscars/ceremonies/2019"))
  end

  def oscar_winner
    self.get_oscar.css("body.section-ceremonies").css(".view-grouping")
  end

  def get_oscar_winners
    self.oscar_winner.each do |oscar|
      main = OscarWinner.new
      main.category = oscar.css("h2").text
      main.winner = oscar.css("h4").first
      main.description = oscar.css(".views-field-title").first
    end
  end
      
  def print_oscar
    self.get_oscar_winners
    OscarWinner.all.each do |course|
      if course.description && course.description != ""
        puts ""
        puts "Category: #{course.category}"
        puts "  Winner: #{course.winner.text}"
        puts "  Description: #{course.description.text.strip}"
      end
    end
  end
end
  

Scraper.new.print_oscar