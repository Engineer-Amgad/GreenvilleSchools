#to get school name => school.css("a").text
#to get school street address => school.css("div.mn-address1").text
#to get school city => school.css("span.mn-cityspan").text
#to get school state => school.css("span.mn-stspan").text
# to get school zip code => school.css("span.mn-zipspan").text
#to get school phone number => school.css("li.mn-phone").text

#go through all odd list then even list
#schools_list.css("div.mn-list-item-odd")
#schools_list.css("div.mn-list-item-even")
require 'open-uri'
require 'pry'
class GreenvilleSchools::Scraper
  
  def pagescrape
    
    url = "https://business.greenvillenc.org/list/category/schools-732"
    schools_list = Nokogiri::HTML(open(url))
    
    schools_array = []
    list_array = schools_list.css("div.mn-list-item-odd")
    # schools_list.css("li.unsaved").each do |school|
      list_array.each do |school|
        binding.pry
      end 
    #   name = school.css(".name").text
    #   address = school.css(".address").text
    #   school_url = school.css("a").attribute("href").value
    #   scale = school.css(".scale").text
      
    #   school_info = {:name => name,
    #             :address => address,
    #             :school_url => school_url, :scale => scale
    #   }
      
    #   schools_array << school_info
    #   end
    # schools_array

  end
  
end 