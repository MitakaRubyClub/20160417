﻿require 'dxruby'
require_relative 'color'
require_relative 'window'
require_relative 'hero'

backwindow=BackWindow.new
hero = Hero.new(BackWindow::WINDOW_WIDTH / 2, BackWindow::SKYLINE)   #Mod

Window.loop do
  backwindow.draw
  hero.move
  hero.draw

  break if Input.key_push?(K_ESCAPE)
end
