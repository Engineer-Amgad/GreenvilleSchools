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
    
    # schools_array = []
    list_array = schools_list.css("div.mn-list-item-odd")

    list_array.each do |school|
      name = school.css("a").text
      street_address = school.css("div.mn-address1").text
      city = school.css("span.mn-cityspan").text
      state  = school.css("span.mn-stspan").text
      zip_code = school.css("span.mn-zipspan").text
      phone = school.css("li.mn-phone").text
      
      # school_info = {:name => name,
      #           :street_address => street_address,
      #           :city => city,
      #           :state => state,
      #           :zip_code => zip_code,
      #           :phone => phone}
      
      # schools_array << school_info
      
      school = GreenvilleSchools::School.new
      school.name = name
      school.street_address = street_address
      school.city = city
      school.state  = state
      school.zip_code = zip_code
      school.phone = phone
      school.save
      
      end
    # schools_array
    # binding.pry
  end
  
end 