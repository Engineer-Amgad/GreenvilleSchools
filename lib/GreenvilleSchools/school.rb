class GreenvilleSchools::School 
  attr_accessor :name, :street_address, :city, :state, :zip_code, :phone
  
  @@all = []
  
  def save
    @@all << self 
  end 
  
  def self.all 
    @@all.sort_by {|school| school.name}.uniq 
  end 
  
end 