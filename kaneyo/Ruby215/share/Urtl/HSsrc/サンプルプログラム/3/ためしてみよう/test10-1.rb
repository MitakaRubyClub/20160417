hp = 5
damage = rand(10)
hp = hp - damage

if hp <= 0
 puts "モンスターをたおした！"
else
 puts "残りのHP: #{hp}"
end
