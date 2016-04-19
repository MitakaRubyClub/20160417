require 'dxruby'
require_relative 'color'
require_relative 'window'
require_relative 'hero'
require_relative 'item'
require_relative 'snail'

def hit?(hero, bomb)
  diffx = hero.centerX - bomb.centerX
  diffy = hero.centerY - bomb.centerY
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

def clicked?(obj)
  clicked = false
  if Input.mouse_push?(M_LBUTTON)
     ## onomura_comment: obj.centerx, obj.centeryがスペル(末尾のx, y)
     ## が間違っていたので修正しました。
     #diffx = Input.mouse_pos_x - obj.centerx
     #diffy = Input.mouse_pos_y - obj.centery
     diffx = Input.mouse_pos_x - obj.centerX
     diffy = Input.mouse_pos_y - obj.centerY
     
     if (diffx > -20) and (diffx < 20) and (diffy > -20) and (diffy < 20)
       clicked = true
     end
  end
  return clicked 
end
 
def game_over(backwindow, hero)
  backwindow.draw_endback
  #hero.draw(0.3)
  hero.draw
  Window.update 
  sleep 2
  exit
end

backwindow=BackWindow.new
hero = Hero.new(BackWindow::WINDOW_WIDTH / 2, BackWindow::SKYLINE)

NBOMB = 3
NAPPLE = 2
NORANGE = 1
NSNAIL = 2    #O_Add:カタツムリの数

sound_back = Sound.new("sound/backg1.mid")
sound_hit = Sound.new("sound/hit1.wav")
sound_tokeru = Sound.new("sound/hit2.wav")
bombs = []
NBOMB.times do
  bombs << Bomb.new
end
apples = []
NAPPLE.times do
  apples << Apple.new
end

#oranges =[]
#NORANGE.times do
  #oranges << Orange.new
#end
 
#O_Add:カタツムリの配列作成
snails = []
NSNAIL.times do |i|
  snails << Snail.new(i)
end
##

score = 0
click_count = 0

sound_back.play

LIMTIME = 20
start_time = Time.now

min_slug_scale = 0.5     #カタツムリの大きさの最小値。この値以下になったらゲームオーバ

Window.loop do
  hero.move
  bombs.each do |bomb|
    bomb.drop
  end
  apples.each do |apple| 
    apple.drop
  end
  #oranges.each do |orange|
    #orange.drop
  #end
  #O_Add
  snails.each do |snail|
    snail.move
  end
  ##

  backwindow.draw
  hero.draw
 
  bombs.each do |bomb|
    bomb.draw
  end
  apples.each do |apple| 
    apple.draw
  end
  #oranges.each do |orange|
    #orange.draw
  #end
  #O_Add
  snails.each do |snail|
    snail.draw
  end
  ##
 
  apples.each do |apple|
    if hit?(hero, apple)
      score += apple.get_score
      sound_hit.play
      apple.reset
    end
  end
 
  #oranges.each do |orange|
    #if hit?(hero, orange)
      #score += orange.get_score
      #orange.reset
    #end
  #end
 
  bombs.each do|bomb|
    if hit?(hero, bomb) 
      sound_tokeru.play
      #game_over(backwindow, hero)  #O_del
      hero.size_changed             #O_Add
    end
  end
 
  ## O_Add
  if hero.scale < min_slug_scale
     game_over(backwindow, hero)
  end
  ##
 
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
  time = LIMTIME - elapsed_time.to_i

  backwindow.write_char(50, 400,"あなたの得点は#{score}点(クリック#{click_count}回)  残り時間は#{time}秒です",Color::WHITE ) 
  #O_Add
  backwindow.write_char(50, 450,"カタツムリのスリム度合は#{hero.scale.round(4)}", Color::RED)
  
  check_score(backwindow, score)   #O_Mod
  if time <= 0
    ## onomura_comment:check_score()はここでは間違いです。
    ##                if time <=0 の外に移動しました。
    #check_score(backwindow, score)  #O_Mod:
    game_over(backwindow, hero)
  end
  break if Input.key_push?(K_ESCAPE)
end
