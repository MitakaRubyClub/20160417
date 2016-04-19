require 'dxruby'

image=Image.new(100,100)
image.line(0,0,90,90,[255,255,0])

Window.loop do
  Window.draw(100,100,image)
  Window.draw(200,200,image)

end
