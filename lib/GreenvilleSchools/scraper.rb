require 'open-uri'
require 'pry'
class GreenvilleSchools::Scraper
  
  attr_accessor :name, 
  #url = "https://www.greatschools.org/north-carolina/greenville/schools/?gradeLevels%5B%5D=h&gradeLevels%5B%5D=m&gradeLevels%5B%5D=e"
  
  def pagescrape
    
    url = "https://www.greatschools.org/north-carolina/greenville/schools/?gradeLevels%5B%5D=h&gradeLevels%5B%5D=m&gradeLevels%5B%5D=e"
    schools_list = Nokogiri::HTML(open(url))
    
    schools_array = []
    
    
    schools_list.css("li.unsaved").each do |school|
      name = school.css(".name").text
      address = school.css(".address").text
      school_url = school.css("a").attribute("href").value
      scale = school.css(".scale").text
      school_info = {:name => name,
                :address => address,
                :school_url => school_url, :scale => scale}
      schools_array << school_info
      end
    schools_array
    binding.pry

    puts "I am here"
  end
  
end 