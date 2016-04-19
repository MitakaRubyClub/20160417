class Tama
  def initialize
    @image=Image.load("image/pai.png")
    @image.set_color_key(Color::WHITE)
   reset
  end

  def shot(obj)
    if @y < 0
      @x = obj.x + obj.image.width / 2 - @image.width / 2
      @y = obj.y
    end
  end

  def move
    if @y > 0
      @y -= @speed
    else
      reset
    end
  end
  def reset
    @x = - @image.width
    @y = -@image.height
    @speed = 30
  end

  def centerX
    return @x + @image.width / 2
  end

  def centerY
    return @y + @image.height / 2
  end
  def draw
    Window.draw( @x, @y, @image )
  end
end