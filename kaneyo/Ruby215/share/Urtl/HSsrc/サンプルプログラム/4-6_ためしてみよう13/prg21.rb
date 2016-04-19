require 'dxruby'

image = Image.new(1, 1, [255, 255, 255])

Window.loop do
  Window.draw(0, 0, image)
  Window.draw(10, 10, image)
  Window.draw(20, 20, image)
  Window.draw(30, 30, image)
  Window.draw(40, 40, image)
  Window.draw(50, 50, image)

end
