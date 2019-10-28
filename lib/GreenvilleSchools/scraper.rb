require 'open-uri'
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
    
    list_array.each do |list_item|
      school = GreenvilleSchools::School.new
      school.name = list_item.css("a").text.chomp('Map')
      school.street_address = list_item.css("div.mn-address1").text
      school.city = list_item.css("span.mn-cityspan").text
      school.state  = list_item.css("span.mn-stspan").text
      school.zip_code = list_item.css("span.mn-zipspan").text
      school.phone = list_item.css("li.mn-phone").text
      school.save
      end
  end 
end 