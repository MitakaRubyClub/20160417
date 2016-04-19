class Item
  attr_reader :x, :y
  def initialize
    #@image = Image.load("image/hero.png")
    @image.set_color_key(Color::WHITE)
    reset
  end

  def drop
    @y = @y + @speed_y
    #@x = @x + @speed_x * 3
    if @y > BackWindow::WINDOW_HEIGHT
      reset

    end
  end

  def reset
    @x = rand (BackWindow::WINDOW_WIDTH)
    @y = 0
    @speed_y = rand(10) + 1
    #@speed_x = rand(3) - 1
  end

  def draw
    Window.draw(@x,@y,@image)
  end

  def centerX
    return @x + @image.width / 2
  end

  def centerY
    return @y + @image.height / 2
  end

end

class Bomb < Item
  def initialize
    @image = Image.load("image/SALT2.png")
    @scale = 0.5
    super
  end

  def drop
    @x = @x + @speed_x * 3
    super

  end

  def reset
    @speed_x = rand(3) - 1
    super
  end
  def draw
    Window.draw_scale(@x,@y,@image,@scale,@scale)
  end
end

class Apple < Item
  def initialize
    @image = Image.load("image/apple.png")
    super
  end

  def get_score
    return 10
  end

  def draw
    Window.draw_scale( @x, @y, @image, 0.7, 0.7)
  end

end