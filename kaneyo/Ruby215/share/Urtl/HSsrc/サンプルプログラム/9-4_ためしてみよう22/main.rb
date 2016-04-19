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

def game_clear(backwindow)
  backwindow.draw_endclear
  Window.update 
  sleep 3
  exit
end

backwindow=BackWindow.new
hero = Hero.new(BackWindow::WINDOW_WIDTH / 2, BackWindow::SKYLINE)

bomb1 = Bomb.new
bomb2 = Bomb.new
bomb3 = Bomb.new
apple1 = Apple.new
apple2 = Apple.new
orange1 = Orange.new

score = 0
click_count = 0

Window.loop do
  hero.move
  bomb1.drop
  bomb2.drop
  bomb3.drop
  apple1.drop
  apple2.drop
  orange1.drop
 
  backwindow.draw
  hero.draw
  bomb1.draw
  bomb2.draw
  bomb3.draw
  apple1.draw
  apple2.draw
  orange1.draw

  if click_count >= 10
    orange1.drop
    orange1.draw
  end
 
  if hit?(hero, apple1)
    score = score + apple1.get_score
    apple1.reset
  end
  if hit?(hero, apple2)
    score = score + apple2.get_score
    apple2.reset
  end
 
  if hit?(hero, orange1)
    score = score + orange1.get_score
    orange1.reset
  end

  if hit?(hero, bomb1) or hit?(hero, bomb2) or hit?(hero, bomb3)
    game_over(backwindow, hero)
  end
 
  if clicked?(bomb1) or clicked?(bomb2) or clicked?(bomb3)
      game_over(backwindow, hero)
  end
 
  if clicked?(apple1)
    score = score + apple1.get_score
    click_count = click_count + 1
    apple1.reset
  end
 
  if clicked?(apple2)
    score = score + apple2.get_score
    click_count = click_count + 1
    apple2.reset
  end
 
  if clicked?(orange1)
    game_clear(backwindow)
  end
 
  backwindow.write_char(50,400,"あなたの得点は#{score}点(クリック#{click_count}回)", Color::WHITE ) 
 
  break if Input.key_push?(K_ESCAPE)
end
