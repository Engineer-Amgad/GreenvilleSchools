require 'pry'
class GreenvilleSchools::CLI 
  
  def call
    
    GreenvilleSchools::Scraper.new.pagescrape
    
    # School.display
    
     input = ""
    while input != "exit"
      puts "Welcome to Greenville area schools' directry!"
      puts "To list all of the schools in area, enter 'list all'."
      puts "To list all of the schools by city, enter 'list by city'."
      puts "To list all of the schools by zip code, enter 'list by zip code'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.strip

      case input
      when "list all"
        list_all
      when "list by city"
        list_by_city
      when "list by zip code"
        list_by_zip_code
      when "play song"
        play_song
      end
    end
  end 
  
  def list_all

   #this give the user a list of the schools sorted by name alphabetically
   
    schools_sorted_by_name = GreenvilleSchools::School.all.sort_by {|school| school.name}.uniq
    
    schools_sorted_by_name.each.with_index(1) do |school,index|
    #binding.pry
      puts "#{index}. #{school.name}"
    end
  end
  
  
end
