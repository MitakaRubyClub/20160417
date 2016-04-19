zzzhp=623000
nagasunahp=72000
while zzzhp > 0 do
  damage=rand(6000)+52000
  zzzhp=zzzhp-damage

  if zzzhp <=0
    puts "nagasunasyousukeの攻撃"
    sleep 1
    puts "敵を殺害した"
  else

    puts "nagasunasyousukeの攻撃"
    sleep 1
    puts "敵残りHP:#{zzzhp}"
    sleep 1

  end
end


























































while nagasunahp > 0 do
  damage=rand(60)+2000
  nagasunahp=nagasunahp-damage

  if nagasunahp <=0
    puts "敵の攻撃"
    sleep 1
    puts "nagasunasyousukeは敵に倒された"
  else

    puts "敵の攻撃"
    sleep 1
    puts "nagasunasyousuke残りHP:#{nagasunahp}"
    sleep 1

  end
end