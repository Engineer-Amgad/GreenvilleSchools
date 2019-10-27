class GreenvilleSchools::School 
  attr_accessor :name, :street_address, :city, :state, :zip_code, :phone
  
  @@all = []
  
  # def initialize
    
  # end 
  
  def save
    @@all << self 
  end 
  
  def self.all 
    @@all 
  end 
  
  def self.display
    School.all.select do |school|
    puts school.name 
    puts "#{school. street_address} #{school.city}, #{school.state} #{school.zip_code}"
    puts school.phone 
    end 
  end 
  
end 