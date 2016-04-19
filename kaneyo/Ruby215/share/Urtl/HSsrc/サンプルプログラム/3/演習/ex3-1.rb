def get_hp
  hp = rand(6)
  return hp + 5
end

monster_hp = get_hp
player_hp = get_hp
puts "モンスターのHPは #{monster_hp} です。"
puts "あなたのHPは #{player_hp} です。"
sleep 1

while monster_hp > 0 do
  monster_damage = rand(10)
  monster_hp = monster_hp - monster_damage
  player_damage = rand(5)
  player_hp = player_hp - player_damage
  puts "#{monster_damage} のダメージを与えた！"
  sleep 1
  if monster_hp <= 0
    puts "モンスターが倒れた！"
    exit
  end
  puts "#{player_damage} のダメージを受けた！"
  sleep 1
  if player_hp <= 0
    puts"あなたが倒れた！"
    exit
  end
end
