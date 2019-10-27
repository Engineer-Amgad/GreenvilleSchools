require 'pry'
class GreenvilleSchools::CLI 
  
  def call
    
    GreenvilleSchools::Scraper.new.pagescrape
    
    School.display
    
  end 
end
