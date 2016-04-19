class Snail
  def initialize(no)
    case no
      when 0
        @imager = Image.load("image/snail1r.png")
        @image = Image.load("image/snail1.png")
      when 1
        @imager = Image.load("image/snail2r.png")
        @image = Image.load("image/snail2.png")
    end
    @image.set_color_key(Color::WHITE)
    @imager.set_color_key(Color::WHITE)
    @x = rand(BackWindow::WINDOW_WIDTH)
    @y = rand(BackWindow::SKYLINE / 2)
    @speedx = rand(2) + 1
  end
 
  def move
    @x += @speedx
    if @x <= 0
       @speedx *= -1
    end
    if @x >= BackWindow::WINDOW_WIDTH - @image.width
       @speedx *= -1
    end
  end
 
  def draw
  if @speedx < 0
    Window.draw(@x, @y, @image)
  end
  if @speedx > 0
    Window.draw(@x, @y, @imager)
  end
  end

end