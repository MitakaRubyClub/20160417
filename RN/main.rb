require 'dxruby'
require_relative 'color'
require_relative 'window'
require_relative 'hero'
require_relative 'item'

def hit?(hero, bomb)
  diffx = hero.centerx - bomb.centerx
  diffy = hero.centery - bomb.centery
  if (diffx > -20) and (diffx < 20) and (diffy > -20) and (diffy < 20)
    return true
  else
    return false
  end
end

def clicked?(obj)
  clicked = false
  if Input.mouse_push?(M_LBUTTON)
    diffx = Input.mouse_pos_x - obj.centerx
    diffy = Input.mouse_pos_y - obj.centery
    if (diffx > -20) and (diffx < 20) and (diffy > -20) and (diffy < 20)
      clicked = true
    end
  end
  return clicked 
end

def game_over(backwindow, hero)
  backwindow.draw_endback
  hero.draw
  Window.update 
  sleep 2
  exit
end

backwindow = BackWindow.new
hero = Hero.new( BackWindow::WINDOW_WIDTH / 2, BackWindow::SKYLINE)

NBOMB = 7
NAPPLE = 6
NORANGE = 3

sound_back = Sound.new("sound/Kalimba.wav")


bombs = []
NBOMB.times do
  bombs << Bomb.new
end

apples = []
NAPPLE.times do
  apples << Apple.new
end

oranges =[]
NORANGE.times do
  oranges << Orange.new
end

score = 0
click_count = 0
start_time = Time.now

sound_back.play

Window.loop do
  hero.move
  bombs.each do |bomb|
    bomb.drop
  end
  apples.each do |apple| 
    apple.drop
  end
  oranges.each do |orange|
    orange.drop
  end

  backwindow.draw
  hero.draw
  bombs.each do |bomb|
    bomb.draw
  end
  apples.each do |apple| 
    apple.draw
  end
  oranges.each do |orange|
    orange.draw
  end

  apples.each do |apple|
    if hit?(hero, apple)
      score += apple.get_score
#      sound_hit.play      
      apple.reset
    end
  end

  oranges.each do |orange|
    if hit?(hero, orange)
      score += orange.get_score
      orange.reset
    end
  end



  bombs.each do|bomb|
    if hit?(hero, bomb) 
      game_over(backwindow, hero)
    end
  end

  bombs.each do|bomb|
    if clicked?(bomb) 
      game_over(backwindow, hero)
    end
  end

  apples.each do |apple| 
    if clicked?(apple)
       score += apple.get_score
       click_count += 1
       apple.reset
    end
  end

  now_time = Time.now
  elapsed_time = now_time - start_time
  integer_second = elapsed_time.to_i

  backwindow.write_char(50, 400, "あなたの得点は#{score}点 目標は1000点 経過時間は #{integer_second}s です", Color::WHITE)

  if score >= 1000
    backwindow.draw_endclear
  end
  break if Input.key_push?(K_ESCAPE)
end