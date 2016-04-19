#!ruby -Ks
# -*- coding: Windows-31J -*-
puts "持っているお金はいくらですか？"
money = gets.to_i

if money >= 100
  puts "ノートは買えます"
else
  puts "ノートは買えません"
end
