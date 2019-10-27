require 'pry'
class GreenvilleSchools::CLI 
  
  def call
    
    GreenvilleSchools::Scraper.new.pagescrape
    
     input = ""
    while input != "exit"
      puts "Welcome to Greenville area schools' directry!"
      puts "To list all of the schools in area, enter 'list all'."
      puts "To list all of the schools by city, enter 'list by city'."
      puts "To list all of the schools by zip code, enter 'list by zip code'."
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
    
    input = ""
   #this give the user a list of the schools sorted by name alphabetically
   
    schools_sorted_by_name = GreenvilleSchools::School.all
    schools_sorted_by_name.each.with_index(1) do |school,index|
      puts "#{index}. #{school.name}"
    end
    puts "=============================="
  end
  
  def list_by_city
    #prints all school in a particular city alphabetically
    puts "Please enter city:"
    input = gets.chomp
    list_by_city = GreenvilleSchools::School.all.select {|school| school.city == input}
    list_by_city.each.with_index(1) do |school,index|
    puts "#{index}. #{school.name}"
    end 
    puts "=============================="
    school_details(list_by_city)
  end 
  
  def school_details(list_of_schools) #this method gives the user detail info about the school they choose.
    input = ""
    while input != "back"
      puts "To get more info about one the schools listed, enter school's number."
      puts "To go back, type 'back'."
      puts "What would you like to do?"
      input = gets.strip
      #binding.pry
      break if input == "back"
        input = input.to_i
        
        if (1..list_of_schools.length).include?(input)
          school = list_of_schools[input-1]
          puts school.name
          puts school.phone
          puts "=============================="
        end
    end 
  end 
  
  
end
