require 'dxruby'
require_relative 'color'
require_relative 'window'

backwindow=BackWindow.new

Window.loop do
  backwindow.draw

  break if Input.key_push?(K_ESCAPE)
end
