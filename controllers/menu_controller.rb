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
    calculate_string(calc_string)
    main_menu

  end

  def calculate_string(calc_array)
    working_calc_array = validate_string(calc_array)
    remaining_array = working_calc_array
    while remaining_array.length != 1
      expr = remaining_array[0..2].join 
      cumulative_result = two_item_calc(expr)
      prepare_next_equation(remaining_array)
      remaining_array.unshift(cumulative_result)
    end
    puts "String calculated to: #{cumulative_result}" 
  end

  def validate_string(calc_string)
    calc_array = []
    calc_array = calc_string.split /([\W])/

    case calc_array
      when calc_array.length == 0
        raise ArgumentError, "can't calculate on array of zero length"
      when calc_array.length == 0
        calc_array[0]
      when calc_array.length == 2
        raise ArgumentError, "can't calculate on array of zero length of 2"
      when calc_array.length > 2
        return calc_array
    end
    calc_array
  end

  def prepare_next_equation (remaining_array)
    for i in 1..3 do
      remaining_array.delete_at(0)
    end
  end

  def two_item_calc(expr)

    result = 0
   
    l_operand, op, r_operand = expr.partition(%r{[/*+-]})

    if l_operand.to_f.is_a? ! Numeric 
      puts "Invalid left operand in expression: #{l_operand}"
    end

    if r_operand.to_f.is_a? ! Numeric
      puts "Invalid right operand in expression: #{r_operand}"
    end

    if op.empty?
      raise ArgumentError, "Invalid operation or no operation in expression: #{expr}"
    end
    l_operand, r_operand = l_operand.to_f, r_operand.to_f

    case op
      when '/' then result = l_operand / r_operand
      when '*' then result = l_operand * r_operand
      when '+' then result = l_operand + r_operand
      when '-' then result = l_operand - r_operand
    end
  end

end

