class Hero
  def initialize( x,y)
    @image=Image.load("image/hero.png")
    @image.set_color_key(Color::WHITE)
    @x = x
    @y = y - @image.height
    @speed = 3
  end

  def move
    @x += Input.x * @speed
    if @x <= 0
      @x = 0
    end
    if @x >= BackWindow::WINDOW_WIDTH - @image.width 
      @x = BackWindow::WINDOW_WIDTH - @image.width
    end
  end

  def draw
    Window.draw(@x, @y, @image) 
  end
end
