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
  end
  if hit?(hero, apple2)
    score = score + apple2.get_score
    apple2.reset
  end
 
  if hit?(hero, bomb1) or hit?(hero, bomb2) or hit?(hero, bomb3)
    backwindow.draw_endback
    hero.draw
    Window.update 
    sleep 2
    exit
  end

  backwindow.write_char(50, 400, "あなたの得点は#{score}点", Color::WHITE )

  break if Input.key_push?(K_ESCAPE)
end
