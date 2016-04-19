class Hero
  attr_reader :x, :y, :scale   #O_Add
  def initialize(x,y)
    @image = Image.load("image/カタツムリ4.png")
    @imager = Image.load("image/カタツムリ4r.png")
    @image.set_color_key(Color::WHITE)
    @imager.set_color_key(Color::WHITE)
    @x = x
    @y = y - @image.height
    @speed = 10
    @scale = 1         #O_Add :ナメクジの大きさの初期値
    @delscale = 0.01   #O_Add :ナメクジの大きさの減少量
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
  
  #O_Add:ナメクジの大きさを減少させる。
  def size_changed
    @scale -= @delscale
  end

  def draw
    #Window.draw_scale(@x,@y,@image,@scale,@scale)   #O_Add @scale
    if Input.x < 0
      #Window.draw(@x, @y, @image)
      Window.draw_scale(@x,@y,@image,@scale,@scale)
    else
      #Window.draw(@x, @y, @imager)
      Window.draw_scale(@x,@y,@imager,@scale,@scale)
    end
  end

  def centerX
    return @x + @image.width / 2
  end

  def centerY
    return @y + @image.height / 2
  end
end