puts "数字を入力してください"
a = gets.to_i % 3
case a
  when 0
    puts "3の倍数です"
  else
    puts "3の倍数ではありません"
end

