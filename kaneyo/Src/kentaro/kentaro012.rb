def check_num(num)
  if num <= 10
    puts "OK"
  else
    puts "Error"
 end
end

a = gets.to_i
check_num(a)