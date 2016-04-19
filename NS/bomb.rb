class Bomb
  attr_reader :x,:y

  def initialize
    @image=Image.load("image/bomb.png")
    @image.set_color_key(Color::WHITE)
    reset
  end

  def drop
    @y = @y + @speed_y
    @x = @x + @speed_x
    if @y >BackWindow::WINDOW_HEIGHT
       reset
    end
  end

  def reset
    @x = rand(BackWindow::WINDOW_WIDTH)
    @y = 0
    @speed_y = (rand 5000)+500
    @speed_x = (rand 5000)-250
  end

  def centerx
    return @x + @image.width / 200
  end

  def centery
    return @y + @image.height / 200
  end

   def draw
    Window.draw( @x, @y, @image)
  end
end
