#!ruby -Ks
# -*- coding: Windows-31J -*-
class HenkouGamenParam
  COLOR_NAME   = [    "[255,100,100]",     "[255,255,100]",         "[0,200,0]",     "[100,100,255]",           "[0,0,0]"]
  COLOR_PALLET = [eval(COLOR_NAME[0]), eval(COLOR_NAME[1]), eval(COLOR_NAME[2]), eval(COLOR_NAME[3]), eval(COLOR_NAME[4])]
  FILE_NAME    = [    "./gazou/1.png",     "./gazou/2.png",     "./gazou/3.png"]

  WINDOW_SIZE_MIN = 100
  WINDOW_SIZE_MAX = 600
  BALL_SIZE_MIN = 1
  BALL_SIZE_MAX = 99
  BALL_SPEED_MIN = 1
  BALL_SPEED_MAX = 9
  BALL_NUM_MIN = 1
  BALL_NUM_MAX = 9

  attr_reader :window_size, :window_color, :window_color_name
  attr_reader :ball_size, :ball_speed, :ball_num, :ball_color, :ball_color_name, :ball_file_name
  attr_reader :secret1, :secret2, :secret3
  attr_accessor :is_game_run

  def initialize
    @window_size      = 600
    @ball_size        = 10
    @ball_speed       = 1
    @ball_num         = 1
    @window_color_name = COLOR_NAME[4]
    @ball_color_name   = COLOR_NAME[0]
    @ball_file_name    = ""
    @window_color     = eval(@window_color_name)
    @ball_color       = eval(@ball_color_name)
    @secret1         = false
    @secret2         = false
    @secret3         = false
    @is_game_run       = false
  end

  def window_size_up
    if @window_size < WINDOW_SIZE_MAX
       @window_size += 10
    end
  end

  def window_size_down
    if @window_size > WINDOW_SIZE_MIN
       @window_size -= 10
    end
  end

  def ball_size_up
    if @ball_size < BALL_SIZE_MAX
       @ball_size += 1
    end
  end

  def ball_size_down
    if @ball_size > BALL_SIZE_MIN
       @ball_size -= 1
    end
  end

  def ball_speed_up
    if @ball_speed < BALL_SPEED_MAX
       @ball_speed += 1
    end
  end

  def ball_speed_down
    if @ball_speed > BALL_SPEED_MIN
       @ball_speed -= 1
    end
  end

  def ball_num_up
    if @ball_num < BALL_NUM_MAX
       @ball_num += 1
    end
  end

  def ball_num_down
    if @ball_num > BALL_NUM_MIN
       @ball_num -= 1
    end
  end

  def change_window_color(c)
    @window_color = COLOR_PALLET[c]
    @window_color_name = COLOR_NAME[c]
  end

  def change_ball_color(c)
    @ball_color = COLOR_PALLET[c]
    @ball_color_name = COLOR_NAME[c]
    @ball_file_name = ""
  end

  def change_ball_file(c)
    @ball_color = ""
    @ball_color_name = ""
    @ball_file_name = FILE_NAME[c]
  end

  def set_secret1
    @secret1 = true
    @secret2 = false
    @secret3 = false
  end

  def set_secret2
    @secret1 = false
    @secret2 = true
    @secret3 = false
  end

  def set_secret3
    @secret1 = false
    @secret2 = false
    @secret3 = true
  end

  def reset_secret
    @secret1 = false
    @secret2 = false
    @secret3 = false
  end
end

