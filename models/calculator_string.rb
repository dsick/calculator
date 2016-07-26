class CalculatorString
  attr_accessor :calc_string, :calc_array

  def initialize(calc_string)
    @calc_string = calc_string
    @calc_array = []
  end

  def validate_string
    calc_array = calc_string.split /([\W])/
    case calc_array.length
      when 0 then raise ArgumentError, "can't calculate on array of zero length"
      when 1 then return calc_array[0]
      when 2 then raise ArgumentError, "can't calculate on array of zero length of 2"
      else 
        @calc_array = calc_array
        calc_array
    end
  end

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

  def calculate
    remaining_array = self.calc_array
    puts "calculate - remaining array: #{remaining_array}"
      while remaining_array.length != 1
        expr = remaining_array[0..2].join 
      cumulative_result = two_item_calc(expr)
      prepare_next_equation(remaining_array)
      remaining_array.unshift(cumulative_result)
      # puts "#{remaining_array}"
    end
    puts "The result is: #{cumulative_result}"
    
  
  end



  def prepare_next_equation(remaining_array)
    for i in 1..3 do
      remaining_array.delete_at(0)
    end
  end

  
end