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

def check_score(backwindow, score)
  if score >= 50
    backwindow.draw_endclear
    Window.update 
    sleep 3
    exit
  end
end

LIMTIME = 20
start_time = Time.now
backwindow=BackWindow.new
hero = Hero.new(BackWindow::WINDOW_WIDTH / 2, BackWindow::SKYLINE)

bomb1 = Bomb.new
bomb2 = Bomb.new
bomb3 = Bomb.new
apple1 = Apple.new
apple2 = Apple.new


score = 0

Window.loop do
  hero.move
  bomb1.drop
  bomb2.drop
  bomb3.drop
  apple1.drop
  apple2.drop
 
  backwindow.draw
  hero.draw
  bomb1.draw
  bomb2.draw
  bomb3.draw
  apple1.draw
  apple2.draw

 
  if hit?(hero, apple1)
    score = score + apple1.get_score
    apple1.reset
    check_score(backwindow, score) 
  end

  if hit?(hero, apple2)
    score = score + apple2.get_score
    apple2.reset
    check_score(backwindow, score) 
  end
 
  now_time = Time.now
  elapsed_time = now_time - start_time
  time = LIMTIME - elapsed_time.to_i

  if hit?(hero, bomb1) or hit?(hero, bomb2) or hit?(hero, bomb3) or time < 0
    backwindow.draw_endback
    hero.draw
    Window.update 
    sleep 2
    exit
  end

  backwindow.write_char(50, 400, "あなたの得点は#{score}点  残り時間は#{time}秒です", Color::WHITE )
 
  break if Input.key_push?(K_ESCAPE)
end
