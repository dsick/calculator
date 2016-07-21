require_relative '../models/calculator_string'

class CalculatorController

  def two_item_calc(expr)

    result = 0
    #combiner expression and run below
    l_operand, op, r_operand = expr.partition(%r{[/*+-]})

	  if op.empty?
	    raise ArgumentError, "Invalid operation or no operation in expression: #{expr}"
	  end
	  l_operand, r_operand = Float(l_operand), Float(r_operand)

	  case op
	    when '/' then result = l_operand / r_operand
	    when '*' then result = l_operand * r_operand
	    when '+' then result = l_operand + r_operand
	    when '-' then result = l_operand - r_operand
	  end
  end

  def calculate_string(calc_array)
	remaining_array = calc_array
  	while remaining_array.length != 1
  	  expr = remaining_array[0..2].join	
	  cumulative_result = two_item_calc(expr)
	  remove_prior_equation(remaining array)
	  remaining_array.unshift(cumulative_result)
	  puts "#{remaining_array}"
	end
	return cumulative_result
  end



  def prepare_next_equation (remaining_array)
	for i in 1..3 do
	  remaining_array.delete_at(0)
	end
  end

end
