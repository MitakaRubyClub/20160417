class BackWindow
  WINDOW_WIDTH  = 640
  WINDOW_HEIGHT = 480
  SKYLINE = 400

  def initialize
    Window.width = WINDOW_WIDTH
    Window.height = WINDOW_HEIGHT
    @image = Image.new(WINDOW_WIDTH, WINDOW_HEIGHT, Color::SKYBLUE)
    @image.box_fill(0, SKYLINE, WINDOW_WIDTH, WINDOW_HEIGHT, Color::GREEN)
  end

  def draw
    Window.draw(0,0,@image)
  end

  def draw_endback
    Window.draw(0,0,@image)
    @image.box_fill(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, Color::BLACK) 
  end
end
