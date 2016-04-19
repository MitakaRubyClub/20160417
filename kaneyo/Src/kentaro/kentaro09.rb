hp = 5
damage = rand(10)
hp = hp - damage
if damage > hp
  puts "モンスターをたおした！"
else
  puts "残りHP：#{hp - damage}"
end