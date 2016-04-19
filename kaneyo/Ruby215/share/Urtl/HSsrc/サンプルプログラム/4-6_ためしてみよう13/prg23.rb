require 'dxruby'

image=Image.new(60,60)
image.circle_fill(30,30,30,[255,255,0])

Window.loop do
  Window.draw(100,100,image)
  Window.draw(200,200,image)

end