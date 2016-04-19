class Bomb
  def initialize
    @image=Image.load("image/bomb.png")
    @image.set_color_key(Color::WHITE)
    reset
  end

  def drop
    @y = @y + @speed_y
    if @y >BackWindow::WINDOW_HEIGHT
       reset
    end
  end

  def reset
    @x = rand(BackWindow::WINDOW_WIDTH)
    @y = 0
    @speed_y = 3
  end

   def draw
    Window.draw( @x, @y, @image)
  end
end
