require 'dxruby'

@font  = Font.new(30, "ＭＳ Ｐゴシック", { :weight=>false, :italic => true })  

Window.loop do
  Window.draw_font( 200, 200,"Hello World", @font, {:color=>[135,206,235]})
  break if Input.key_push?(K_ESCAPE)
end
