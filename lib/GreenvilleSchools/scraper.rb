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
    
    list_array = schools_list.css("div.mn-list-item-odd")
    objects_creater(list_array)
    
    list_array = schools_list.css("div.mn-list-item-even")
    objects_creater(list_array)
  end
  
  def objects_creater(list_array)
    
    list_array.each do |school|
      name = school.css("a").text
      street_address = school.css("div.mn-address1").text
      city = school.css("span.mn-cityspan").text
      state  = school.css("span.mn-stspan").text
      zip_code = school.css("span.mn-zipspan").text
      phone = school.css("li.mn-phone").text
      
      school = GreenvilleSchools::School.new
      school.name = name
      school.street_address = street_address
      school.city = city
      school.state  = state
      school.zip_code = zip_code
      school.phone = phone
      school.save
      end
  end 
end 