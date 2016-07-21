class CalculatorString
  attr_accessor :calc_string

  def initialize(calc_string)
    calc_array = []
    calc_array = calc_string.split /([\W])/
    validate_string(@calc_array)
  end

  def validate_string(calc_array)

    case calc_array
      when calc_array.length == 0 then raise ArgumentError, "can't calculate on array of zero length"
      when calc_array.length == 0 then return calc_array[0]
      when calc_array.length == 2 then raise ArgumentError, "can't calculate on array of zero length of 2"
      when calc_array.length >= 3 then return calc_array
    end
  end

  # begin
    
  # rescue Exception => e
  #   myresult2 = e
  # end
end