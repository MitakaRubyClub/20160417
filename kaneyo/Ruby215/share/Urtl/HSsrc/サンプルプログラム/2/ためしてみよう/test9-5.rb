puts "数字を入力してください"
a = gets.to_i
case a
  when 3,6,9
    puts "3の倍数です"
  when 1,2,4,5,7,8,10
    puts "3の倍数ではありあせん"
  else
    puts "エラー"
end

