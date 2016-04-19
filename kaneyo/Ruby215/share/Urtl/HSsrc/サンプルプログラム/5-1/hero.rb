class Hero
  def initialize( x,y)
    @image=Image.load("image/hero.png")
    @image.set_color_key(Color::WHITE)
    @x = x
    @y = y
  end

  def draw
    Window.draw(@x, @y, @image) 
  end
end
