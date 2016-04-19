hp = 9

while hp > 0 do
  damage = rand(10)
  hp = hp - damage
  if hp <= 0
    puts "モンスターをたおした！"
  else
    puts "残りのHP: #{hp}"
  end
end
