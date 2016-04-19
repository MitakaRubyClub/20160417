require 'dxruby'
require_relative 'color'
require_relative 'window'
require_relative 'hero'
require_relative 'bomb'

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

Window.loop do
  hero.move
  bomb1.drop
  bomb2.drop
  bomb3.drop

  if hit?(hero, bomb1) or hit?(hero, bomb2) or hit?(hero, bomb3)

    backwindow.draw_endback
    hero.draw
    Window.update 
    sleep 2

    exit
  end

  backwindow.draw
  hero.draw
  bomb1.draw
  bomb2.draw
  bomb3.draw

  break if Input.key_push?(K_ESCAPE)
end
