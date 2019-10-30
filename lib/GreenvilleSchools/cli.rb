require 'colorize'
class GreenvilleSchools::CLI 
  
  def call
    
    GreenvilleSchools::Scraper.new.pagescrape
    
     input = ""
    while input != "exit"
      puts "Welcome to Greenville area schools' directry!".colorize(:light_green)
      puts "To list all of the schools in area, enter 'list all'.".colorize(:light_green)
      puts "To list all of the schools by city, enter 'list by city'.".colorize(:light_green)
      puts "To list all of the schools by zip code, enter 'list by zip code'.".colorize(:light_green)
      puts "To quit, type 'exit'.".colorize(:light_green)
      puts "What would you like to do?".colorize(:light_green)
      input = gets.strip

      case input
        when "list all"
          list_all
        when "list by city"
          list_by_city
        when "list by zip code"
          list_by_zip_code
      end
    end
  end 
  
  def list_all #Prints a list of the all schools in Greenville area sorted by name alphabetically
   
    schools_sorted_by_name = GreenvilleSchools::School.all
    schools_sorted_by_name.each.with_index(1) do |school,index|
      puts "#{index}. #{school.name}".colorize(:light_blue)
    end
    puts "=============================="
  end
  
  def list_by_city #prints all schools in a particular city alphabetically

    cities_array = []
    GreenvilleSchools::School.all.each {|school| cities_array << school.city}
    input = ""
    while input != "back"
      puts "Please enter a city in Greenville area: Greenville, Winterville, Ayden, Farmville, Grimesland, Bethel, Grifton, Stokes!".colorize(:light_green)
      puts "To go back, type 'back'.".colorize(:light_green)
      puts "What would you like to do?".colorize(:light_green)
      input = gets.chomp
      if cities_array.include?(input)
        list_by_city = GreenvilleSchools::School.all.select {|school| school.city == input}
        list_by_city.each.with_index(1) do |school,index|
        puts "#{index}. #{school.name}".colorize(:light_blue)
        end 
        puts "=============================="
        school_details(list_by_city)
      end
    end 
  end
  
  
  def list_by_zip_code #prints all schools in a particular zip code alphabetically
    zip_codes_array = []
    GreenvilleSchools::School.all.each {|school| zip_codes_array << school.zip_code}
    input = ""
    while input != "back"
      puts "Please enter a zip code in Greenville area: 27834, 27858, 27884, 27828, 28530, 28590, 28513, 27837, 27812!".colorize(:light_green)
      puts "To go back, type 'back'.".colorize(:light_green)
      puts "What would you like to do?".colorize(:light_green)
      input = gets.chomp
      if zip_codes_array.include?(input)
        list_by_zip_code = GreenvilleSchools::School.all.select {|school| school.zip_code == input}
        list_by_zip_code.each.with_index(1) do |school,index|
        puts "#{index}. #{school.name}".colorize(:light_blue)
        end 
        puts "=============================="
        school_details(list_by_zip_code)
      end
    end 
  end 
  
  def school_details(list_of_schools) #prints detail info about the school they choose.
    input = ""
    while input != "back"
      puts "To get more info about a listed school, enter school's number from list above.".colorize(:light_green)
      puts "To go back, type 'back'.".colorize(:light_green)
      puts "To go main manue, type 'main'.".colorize(:light_green)
      puts "What would you like to do?".colorize(:light_green)
      input = gets.chomp
      break if input == "back"
        input = input.to_i
        
        if (1..list_of_schools.length).include?(input)
          school = list_of_schools[input-1]
          puts "Name: #{school.name}.".colorize(:light_blue)
          puts "Address: #{school.street_address} #{school.city}, #{school.state} #{school.zip_code}.".colorize(:light_blue)
          puts "Phone number: #{school.phone}.".colorize(:light_blue)
          puts "=============================="
        end
    end 
  end 
  
end
