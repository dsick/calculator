def calc(expr)

  result = 0
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

puts "Enter your equation"
expr = gets.chomp
myresult = calc(expr)
puts "#{myresult}"

