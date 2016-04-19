require 'dxruby'
require_relative 'color'
require_relative 'window'
require_relative 'hero'
require_relative 'bomb'

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

  backwindow.draw
  hero.draw
  bomb1.draw
  bomb2.draw
  bomb3.draw

  break if Input.key_push?(K_ESCAPE)
end
