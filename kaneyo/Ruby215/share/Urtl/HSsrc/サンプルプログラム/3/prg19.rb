def  check_win(hp, damage)
  if hp < damage
    return "勝ち"
  else
    return "負け"
  end
end

hp = 10
damage = gets.to_i
a = check_win(hp, damage)
puts a
