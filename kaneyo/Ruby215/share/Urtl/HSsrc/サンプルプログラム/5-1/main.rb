require 'dxruby'
require_relative 'color'
require_relative 'window'
require_relative 'hero'

backwindow=BackWindow.new
hero = Hero.new(0,0)

Window.loop do
  backwindow.draw
  hero.draw

  break if Input.key_push?(K_ESCAPE)
end
