#!ruby -Ks
# -*- coding: Windows-31J -*-
# このプログラムはこのままでは、エラーになり正しく動きません

puts "持っているお金はいくらですか？"
money = gets.to_i

if money  100		# この行の money と 100 の間に入れる記号を考えましょう
  puts "ノートは買えません"
else
  puts "ノートは買えます"
end
