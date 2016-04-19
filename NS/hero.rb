class Hero
  attr_reader :x,:y

  def initialize( x,y)
    @image=Image.load("image/hero.png")
    @image.set_color_key(Color::WHITE)
    @x = x
    @y = y - @image.height
#    @y = y
    @spped = 5
  end

  def centerx
    return @x + @image.width / 2
  end

  def centery
    return @y + @image.height / 2
  end

  def draw
    Window.draw(@x, @y, @image) 
end

  def move
    @x += Input.x * @spped
    @y += Input.y * @spped

#    if @x >= BackWindow::WINDOW_WIDTH - @image.width 
#      @x = BackWindow::WINDOW_WIDTH - @image.width
#    end

#    if @y >= BackWindow::WINDOW_WIDTH - @image.width 
#      @y = BackWindow::WINDOW_WIDTH - @image.width
#    end

    if @x < 0
      @x = 0
    end

    if @x > 640-56
      @x = 640-56
    end

    if @y < 0
      @y = 0
    end

    if @y > 400-38
      @y = 400-38
    end

  end
end
