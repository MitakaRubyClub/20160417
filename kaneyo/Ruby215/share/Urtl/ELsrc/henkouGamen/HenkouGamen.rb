#!ruby -Ks
# -*- coding: Windows-31J -*-
require_relative "../kihon/Waku"
require_relative "HenkouGamenWindow"
require_relative "HenkouGamenParam"
require_relative "HenkouGamenFile"

Window.caption="プログラム学習ツール"
def clean_up
  if File.exists?(END_SWITCH_FILE)
     File.delete(END_SWITCH_FILE)
  end
end

def run_game
  clean_up
  f = HenkouGamenFile.new
  f.update_files(@param)
  @game_thread = Thread.new do
    system("ruby ../game/Game.rb")
  end
  @param.is_game_run = true
end

def show_code(filename)
  f = HenkouGamenFile.new
  f.update_files(@param)
  Thread.new do
        system('"' + Dir.pwd[0,2] + '\Ruby\Ruby200p481\share\edtp\TeraPad109\TeraPad.exe" /r ../game/' + filename)
  end
end

def is_click?(x, y)
  ret = true

  case @window.which_clicked(x, y)
    when HenkouGamenWindow::NONE
      ret = false
    when HenkouGamenWindow::FINISH_BUTTON
      clean_up
      exit
    when HenkouGamenWindow::ZIKKOU_BUTTON
      if @param.is_game_run
         f = File.new(END_SWITCH_FILE, "w")
         f.close
         @param.is_game_run = false
      else
         @param.reset_secret
         run_game
      end
    when HenkouGamenWindow::SECRET1_BUTTON
      @param.set_secret1
      run_game
    when HenkouGamenWindow::SECRET2_BUTTON
      @param.set_secret2
      run_game
    when HenkouGamenWindow::SECRET3_BUTTON
      @param.set_secret3
      run_game
    when HenkouGamenWindow::WINDOW_BUTTON
      show_code("GameWaku.rb")
      ret = false
    when HenkouGamenWindow::BALL_BUTTON
      if @param.ball_color_name == ""
         show_code("BallGazou.rb")
      else
         show_code("BallMaru.rb")
      end
      ret = false
    when HenkouGamenWindow::WINDOW_SIZE_UP
      @param.window_size_up
    when HenkouGamenWindow::WINDOW_SIZE_DOWN
      @param.window_size_down
    when HenkouGamenWindow::BALL_SIZE_UP
      @param.ball_size_up
    when HenkouGamenWindow::BALL_SIZE_DOWN
      @param.ball_size_down
    when HenkouGamenWindow::BALL_SPEED_UP
      @param.ball_speed_up
    when HenkouGamenWindow::BALL_SPEED_DOWN
      @param.ball_speed_down
    when HenkouGamenWindow::BALL_NUMBER_UP
      @param.ball_num_up
    when HenkouGamenWindow::BALL_NUMBER_DOWN
      @param.ball_num_down
    when HenkouGamenWindow::WINDOW_COLOR1
      @param.change_window_color(0)
    when HenkouGamenWindow::WINDOW_COLOR2
      @param.change_window_color(1)
    when HenkouGamenWindow::WINDOW_COLOR3
      @param.change_window_color(2)
    when HenkouGamenWindow::WINDOW_COLOR4
      @param.change_window_color(3)
    when HenkouGamenWindow::WINDOW_COLOR5
      @param.change_window_color(4)
    when HenkouGamenWindow::BALL_COLOR1
      @param.change_ball_color(0)
    when HenkouGamenWindow::BALL_COLOR2
      @param.change_ball_color(1)
    when HenkouGamenWindow::BALL_COLOR3
      @param.change_ball_color(2)
    when HenkouGamenWindow::BALL_COLOR4
      @param.change_ball_color(3)
    when HenkouGamenWindow::BALL_COLOR5
      @param.change_ball_color(4)
    when HenkouGamenWindow::BALL_COLOR6
      @param.change_ball_file(0)
    when HenkouGamenWindow::BALL_COLOR7
      @param.change_ball_file(1)
    when HenkouGamenWindow::BALL_COLOR8
      @param.change_ball_file(2)
  end

  return ret
end


END_SWITCH_FILE = "endSwitch"

@window = HenkouGamenWindow.new

@param  = HenkouGamenParam.new
@window.change_parm(@param)
@game_thread = nil

Window.loop do
  Window.draw(0,0,$image,0)
  
  if Input.mouse_push?(M_LBUTTON) then
     is_click?(Input.mouse_pos_x , Input.mouse_pos_y)  
  end
 
  if @game_thread and @game_thread.status == false
     @param.is_game_run = false
  end

  @window.change_parm(@param)
  Window.draw_scale(HenkouGamenWindow::COLOR6_X, HenkouGamenWindow::B_COLR_Y, $image1, $ritu1, $ritu1,0,0)
  Window.draw_scale(HenkouGamenWindow::COLOR7_X, HenkouGamenWindow::B_COLR_Y, $image2, $ritu2, $ritu2,0,0)
  Window.draw_scale(HenkouGamenWindow::COLOR8_X, HenkouGamenWindow::B_COLR_Y, $image3, $ritu3, $ritu3,0,0)
 
	# エスケープキーで終了
  break if Input.key_push?(K_ESCAPE)

end

