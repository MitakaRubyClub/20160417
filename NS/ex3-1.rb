def get_hp
  hp = rand(6000)+226900
  return hp + 5
end

monster_hp = get_hp
sleep 0.9
puts "モンスターのHPは #{monster_hp} です。"
#プレイヤー（player_hp）のhpをゲットする
#putsでプレイヤーのhp（player_hp）を表示する
player_hp = get_hp
sleep 0.9
puts "あなたのHPは #{player_hp} です。"

while monster_hp > 0 do
sleep 0.9
  puts "攻撃しますか？　　(Y)"
  attack = gets.chomp
  if attack != "Y"
#elsif
  sssattack = gets.chomp
  if sssattack != "S"
    puts "syousukenagasunaの攻撃S"
sleep 0.9
    puts "クリティカルヒット！！！"
sleep 0.9
    puts "敵に98470000の超絶ダメージ！"
sleep 0.9
    puts "敵を瞬殺した"
    exit
#else
  end

    puts "また今度食ってやる！"
sleep 0.9
    exit
  end
#  end

  monster_damage = rand(60000)+29530
  monster_hp = monster_hp - monster_damage
#プレイヤーのダメージ値（player_damage）をゲットする
#プレイヤーのHP（player_hp）からダメージ（player_damage）を引く
  player_damage = rand(70000)+25000
  player_hp = player_hp - player_damage

sleep 0.9
  puts "syousukenagasunaの攻撃"
sleep 0.9
  puts "#{monster_damage}のダメージを与えた！ "
sleep 0.9
  if monster_hp <= 0
    puts "敵を殺害した"
    exit
  end
#putsでプレイヤーのダメージ値（player_damage）を表示
#if文：もし、プレイヤーのHP（player_hp）が0以下だったら
#putsで"あなたが倒れた"と表示
#処理を抜ける
#if文:終わり

sleep 0.9
  puts "敵の攻撃"
sleep 0.9
  puts "#{player_damage}のダメージ "
sleep 0.9
  if player_hp <= 0
    puts "syousukenagasunaは敵に暗殺された"
    exit
  end
end
