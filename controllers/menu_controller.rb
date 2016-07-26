require_relative '../models/calculator_string'
require_relative 'calculator_controller.rb'

class MenuController
  

  def main_menu

    puts "Main Menu - String Calculator"
    puts "1 - Perform a string calulation"
    puts "2 - Exit"
    print "Enter your selection: "

    selection = gets.to_i

    case selection
    when 1
      system "clear"
      calculate
      main_menu
    when 2
      puts "Good-bye!"
      exit(0)
    else
      system "clear"
      puts "Sorry, that is not a valid input"
      main_menu
    end
  end 

  def calculate
    
    system "clear"
    puts "New String Cacluation"

    print "Enter Calculation String: "
    calc_string = gets.chomp
    calc = CalculatorString.new(calc_string)
    calc.validate_string
    calc.calculate
  rescue ArgumentError => e
    puts "There was an argument error: #{e}"
  rescue Exception => e
    puts "There was a general error: #{e}"
  ensure
    main_menu
  end


  
  

end

