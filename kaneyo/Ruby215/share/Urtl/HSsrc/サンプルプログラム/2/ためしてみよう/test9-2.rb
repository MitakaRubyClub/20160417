puts "数字を入力してください"
a = gets.to_i
case a
  when -1
    puts "数字は-1です"
  when 1
    puts "数字は1です"
  when 2
    puts "数字は2です"
  else
    puts "1、2、-1以外の数字です"
end

