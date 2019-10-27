require 'pry'
class GreenvilleSchools::School 
  attr_accessor :name, :street_address, :city, :state, :zip_code, :phone
  
  @@all = []
  
  def save
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.display
    @@all.select do |school|
    puts school.name 
    puts "#{school. street_address} #{school.city}, #{school.state} #{school.zip_code}"
    puts school.phone 
    end 
  end 
  
  def self.create
    GreenvilleSchools::Scraper.new.pagescrape
    self.display
    binding.pry
  end 
end 