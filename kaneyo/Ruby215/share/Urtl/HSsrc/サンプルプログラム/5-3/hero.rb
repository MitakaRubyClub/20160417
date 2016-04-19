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
  end

  def draw
    Window.draw(@x, @y, @image) 
  end
end
