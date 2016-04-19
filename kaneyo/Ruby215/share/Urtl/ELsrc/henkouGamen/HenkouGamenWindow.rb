#!ruby -Ks
# -*- coding: Windows-31J -*-
require_relative "../kihon/Color"
require_relative "../kihon/Waku"
require_relative "HenkouGamenParam"

class HenkouGamenWindow < Waku

  NONE             = 0	# クリック場所の戻り値
  WINDOW_SIZE_UP   = 1
  WINDOW_SIZE_DOWN = 2
  BALL_SIZE_UP     = 3
  BALL_SIZE_DOWN   = 4
  BALL_SPEED_UP    = 5
  BALL_SPEED_DOWN  = 6
  BALL_NUMBER_UP   = 7
  BALL_NUMBER_DOWN = 8
  FINISH_BUTTON     = 9
  ZIKKOU_BUTTON    = 10
  WINDOW_BUTTON    = 11
  BALL_BUTTON      = 12
  WINDOW_COLOR1    = 13
  WINDOW_COLOR2    = 14
  WINDOW_COLOR3    = 15
  WINDOW_COLOR4    = 16
  WINDOW_COLOR5    = 17
  BALL_COLOR1      = 18
  BALL_COLOR2      = 19
  BALL_COLOR3      = 20
  BALL_COLOR4      = 21
  BALL_COLOR5      = 22
  BALL_COLOR6      = 23
  BALL_COLOR7      = 24
  BALL_COLOR8      = 25
  SECRET1_BUTTON   = 26
  SECRET2_BUTTON   = 27
  SECRET3_BUTTON   = 28

  WINDOW_YOKO = 800	# 画面の幅
  WINDOW_TATE = 600	# 画面の高さ
  Window.width = WINDOW_YOKO
  Window.height = WINDOW_TATE

  BOX_W1 = 35.0	        # 1桁用の入力欄の幅（表示用画像の縮小率計算のため小数点以下が必要）
  BOX_W2 = 50		# 2桁用の入力欄の幅
  BOX_W3 = 70		# 3桁用の入力欄の幅
  BOX_H  = 40		# 入力欄の高さ
  UPDOWN_WH = 20	# 上下ボタンの幅・高さ

  FINISH_X   = 620	# 終わりボタンのX座標
  FINISH_Y   = 20	# 終わりボタンのY座標
  MIRU_X    = 310	# 見るボタンのX座標
  W_MIRU_Y  = 15	# ウィンドウの見るボタンのY座標
  B_MIRU_Y  = 230	# ボールの見るボタンのY座標
  ZIKKOU_X  = 600	# 実行ボタンのX座標
  ZIKKOU_Y  = 500	# 実行ボタンのY座標
    
  SECRET1_X = 50			# ひみつのボタン１のX座標
  SECRET2_X = SECRET1_X + 130		# ひみつのボタン２のX座標
  SECRET3_X = SECRET1_X + 130 * 2	# ひみつのボタン３のX座標
  SECRET_Y  = 530			# ひみつのボタンのY座標

  BOX_X       = 410				# 入力欄のX座標
  NUM_X       = BOX_X + 10			# 入力欄内の数字のX座標
  W_SIZE_Y    = 90				# ウィンドウのサイズ入力欄のY座標
  W_COLR_Y    = W_SIZE_Y + (BOX_H + 20)	        # ウィンドウの色入力欄のY座標
  B_SIZE_Y    = 300				# ボールのサイズ入力欄のY座標
  B_COLR_Y    = B_SIZE_Y + (BOX_H + 20)   	# ボールの色入力欄のY座標
  B_SPED_Y    = B_SIZE_Y + (BOX_H + 20) * 2	# ボールの速さ入力欄のY座標
  B_NUMB_Y    = B_SIZE_Y + (BOX_H + 20) * 3	# ボールの数入力欄のY座標

  W_SIZE_UPDOWN_X = BOX_X + BOX_W3 + 10	# ウィンドウのサイズ上下ボタンのX座標
  B_SIZE_UPDOWN_X = BOX_X + BOX_W2 + 10	# ボールのサイズ上下ボタンのX座標
  B_SPED_UPDOWN_X = BOX_X + BOX_W1 + 10	# ボールの速さ上下ボタンのX座標
  B_NUMB_UPDOWN_X = BOX_X + BOX_W1 + 10	# ボールの数上下ボタンのX座標

  W_SIZE_UP_Y = W_SIZE_Y			# ウィンドウのサイズ上ボタンのY座標
  W_SIZE_DW_Y = W_SIZE_Y + UPDOWN_WH		# ウィンドウのサイズ下ボタンのY座標
  B_SIZE_UP_Y = B_SIZE_Y			# ボールのサイズ上ボタンのY座標
  B_SIZE_DW_Y = B_SIZE_Y + UPDOWN_WH		# ボールのサイズ下ボタンのY座標
  B_SPED_UP_Y = B_SPED_Y			# ボールの速さ上ボタンのY座標
  B_SPED_DW_Y = B_SPED_Y + UPDOWN_WH		# ボールの速さ下ボタンのY座標
  B_NUMB_UP_Y = B_NUMB_Y			# ボールの数上ボタンのY座標
  B_NUMB_DW_Y = B_NUMB_Y + UPDOWN_WH		# ボールの数下ボタンのY座標

  COLOR1_X = BOX_X + BOX_W3 + 20		# カラーパレット１のX座標
  COLOR2_X = COLOR1_X + BOX_W1			# カラーパレット２のX座標
  COLOR3_X = COLOR1_X + BOX_W1 * 2		# カラーパレット３のX座標
  COLOR4_X = COLOR1_X + BOX_W1 * 3		# カラーパレット４のX座標
  COLOR5_X = COLOR1_X + BOX_W1 * 4		# カラーパレット５のX座標
  COLOR6_X = COLOR1_X + BOX_W1 * 5		# カラーパレット６のX座標
  COLOR7_X = COLOR1_X + BOX_W1 * 6		# カラーパレット７のX座標
  COLOR8_X = COLOR1_X + BOX_W1 * 7		# カラーパレット８のX座標


  def initialize(width=WINDOW_YOKO, height=WINDOW_TATE)
    super
    sikaku(0, 0, WINDOW_YOKO, WINDOW_TATE, Color::SIRO)
    @font = suuzi_zyunbi(32)

    image = gazou_zyunbi("./image/string.png", Color::SIRO)
        
    $image = gazou(image, 0, 0)
    @btn_owari = gazou_zyunbi("./image/btn_owari.png", Color::SIRO)
    gazou(@btn_owari, FINISH_X, FINISH_Y)
    @btn_miru = gazou_zyunbi("./image/btn_miru.png", Color::SIRO)
    gazou(@btn_miru, MIRU_X, W_MIRU_Y)
    gazou(@btn_miru, MIRU_X, B_MIRU_Y)
    @btn_zikkou  = gazou_zyunbi("./image/btn_zikkou.png", Color::SIRO)
    @btn_tomeru  = gazou_zyunbi("./image/btn_tomeru.png", Color::SIRO)
    @btn_secret1 = gazou_zyunbi("./image/btn_secret1.png", Color::SIRO)
    @btn_secret2 = gazou_zyunbi("./image/btn_secret2.png", Color::SIRO)
    @btn_secret3 = gazou_zyunbi("./image/btn_secret3.png", Color::SIRO)

    img_up = gazou_zyunbi("./image/btn_up.png", Color::SIRO)
    img_dw = gazou_zyunbi("./image/btn_down.png", Color::SIRO)
    gazou(img_up, W_SIZE_UPDOWN_X, W_SIZE_UP_Y)
    gazou(img_dw, W_SIZE_UPDOWN_X, W_SIZE_DW_Y)
    gazou(img_up, B_SIZE_UPDOWN_X, B_SIZE_UP_Y)
    gazou(img_dw, B_SIZE_UPDOWN_X, B_SIZE_DW_Y)
    gazou(img_up, B_SPED_UPDOWN_X, B_SPED_UP_Y)
    gazou(img_dw, B_SPED_UPDOWN_X, B_SPED_DW_Y)
    gazou(img_up, B_NUMB_UPDOWN_X, B_NUMB_UP_Y)
    gazou(img_dw, B_NUMB_UPDOWN_X, B_NUMB_DW_Y)

    sikaku(COLOR1_X, W_COLR_Y, BOX_W1, BOX_H, HenkouGamenParam::COLOR_PALLET[0])
    sikaku(COLOR2_X, W_COLR_Y, BOX_W1, BOX_H, HenkouGamenParam::COLOR_PALLET[1])
    sikaku(COLOR3_X, W_COLR_Y, BOX_W1, BOX_H, HenkouGamenParam::COLOR_PALLET[2])
    sikaku(COLOR4_X, W_COLR_Y, BOX_W1, BOX_H, HenkouGamenParam::COLOR_PALLET[3])
    sikaku(COLOR5_X, W_COLR_Y, BOX_W1, BOX_H, HenkouGamenParam::COLOR_PALLET[4])
    sikaku(COLOR1_X, B_COLR_Y, BOX_W1, BOX_H, HenkouGamenParam::COLOR_PALLET[0])
    sikaku(COLOR2_X, B_COLR_Y, BOX_W1, BOX_H, HenkouGamenParam::COLOR_PALLET[1])
    sikaku(COLOR3_X, B_COLR_Y, BOX_W1, BOX_H, HenkouGamenParam::COLOR_PALLET[2])
    sikaku(COLOR4_X, B_COLR_Y, BOX_W1, BOX_H, HenkouGamenParam::COLOR_PALLET[3])
    sikaku(COLOR5_X, B_COLR_Y, BOX_W1, BOX_H, HenkouGamenParam::COLOR_PALLET[4])
    sikaku_waku(COLOR6_X, B_COLR_Y, BOX_W1, BOX_H, Color::HAI)
    sikaku_waku(COLOR7_X, B_COLR_Y, BOX_W1, BOX_H, Color::HAI)
    sikaku_waku(COLOR8_X, B_COLR_Y, BOX_W1, BOX_H, Color::HAI)


    $image1 = gazou_zyunbi("../game/gazou/1.png", Color::SIRO)
    if $image1.height > $image1.width
       $ritu1 = BOX_W1 / $image1.height
			
    else
       $ritu1 = BOX_W1 / $image1.width
    end
        
		
    $image2 = gazou_zyunbi("../game/gazou/2.png", Color::SIRO)
    if $image2.height > $image2.width
       $ritu2 = BOX_W1 / $image2.height
    else
       $ritu2 = BOX_W1 / $image2.width
    end
        
    $image3 = gazou_zyunbi("../game/gazou/3.png", Color::SIRO)
    if $image3.height > $image3.width
       $ritu3 = BOX_W1 / $image3.height
    else
       $ritu3 = BOX_W1 / $image3.width
    end
        

    @zikkou_click_count  = 0
    @is_secret1 = false
    @is_secret2 = false
    @is_secret3 = false
  end

  def change_parm(p)
    sikaku(BOX_X, W_SIZE_Y, BOX_W3, BOX_H, Color::USUI_KI)
    sikaku(BOX_X, B_SIZE_Y, BOX_W2, BOX_H, Color::USUI_KI)
    sikaku(BOX_X, B_SPED_Y, BOX_W1, BOX_H, Color::USUI_KI)
    sikaku(BOX_X, B_NUMB_Y, BOX_W1, BOX_H, Color::USUI_KI)
    sikaku(BOX_X, W_COLR_Y, BOX_W3, BOX_H, p.window_color)

    if p.ball_color_name == ""
           
       sikaku(BOX_X, B_COLR_Y, BOX_W3, BOX_H, Color::SIRO)
       sikaku_waku(BOX_X, B_COLR_Y, BOX_W3, BOX_H, Color::HAI)

       # --- 画像表示
       file_name = p.ball_file_name.sub("./gazou", "../game/gazou")
       image = gazou_zyunbi(file_name, Color::SIRO)
       if image.height > image.width
          ritu = BOX_W1 / image.height
       else
          ritu = BOX_W1 / image.width
       end
          gazou(image, BOX_X + 20, B_COLR_Y, ritu)
    else
       sikaku(BOX_X, B_COLR_Y, BOX_W3, BOX_H, p.ball_color)
    end

    suuzi(@font, p.window_size.to_s, NUM_X, W_SIZE_Y, Color::KURO)
    suuzi(@font, p.ball_size.to_s,   NUM_X, B_SIZE_Y, Color::KURO)
    suuzi(@font, p.ball_speed.to_s,  NUM_X, B_SPED_Y, Color::KURO)
    suuzi(@font, p.ball_num.to_s,    NUM_X, B_NUMB_Y, Color::KURO)

    if p.is_game_run
       gazou(@btn_tomeru, ZIKKOU_X, ZIKKOU_Y)
    else
       gazou(@btn_zikkou, ZIKKOU_X, ZIKKOU_Y)
    end

# --- ひみつのボタン出現条件
    if @zikkou_click_count == 10
       gazou(@btn_secret1, SECRET1_X, SECRET_Y)
       @is_secret1 = true
    end
    if @zikkou_click_count == 15
       gazou(@btn_secret2, SECRET2_X, SECRET_Y)
       @is_secret2 = true
    end
    if @is_secret1 and @is_secret2 and 
       p.window_size == HenkouGamenParam::WINDOW_SIZE_MAX and
       p.ball_size   == HenkouGamenParam::BALL_SIZE_MAX   and
       p.ball_speed  == HenkouGamenParam::BALL_SPEED_MAX  and
       p.ball_num    == HenkouGamenParam::BALL_NUM_MAX
       gazou(@btn_secret3, SECRET3_X, SECRET_Y)
       @is_secret3 = true
    end

       
  end

  def which_clicked(x, y)
    ret = NONE
        
    if x >= W_SIZE_UPDOWN_X and x <= (W_SIZE_UPDOWN_X + UPDOWN_WH) and
       y >= W_SIZE_UP_Y     and y <= (W_SIZE_UP_Y     + UPDOWN_WH)
       ret = WINDOW_SIZE_UP
    elsif x >= W_SIZE_UPDOWN_X and x <= (W_SIZE_UPDOWN_X + UPDOWN_WH) and
          y >= W_SIZE_DW_Y     and y <= (W_SIZE_DW_Y     + UPDOWN_WH)
          ret = WINDOW_SIZE_DOWN
    elsif x >= B_SIZE_UPDOWN_X and x <= (B_SIZE_UPDOWN_X + UPDOWN_WH) and
          y >= B_SIZE_UP_Y     and y <= (B_SIZE_UP_Y     + UPDOWN_WH)
          ret = BALL_SIZE_UP
    elsif x >= B_SIZE_UPDOWN_X and x <= (B_SIZE_UPDOWN_X + UPDOWN_WH) and
          y >= B_SIZE_DW_Y     and y <= (B_SIZE_DW_Y     + UPDOWN_WH)
          ret = BALL_SIZE_DOWN
    elsif x >= B_SPED_UPDOWN_X and x <= (B_SPED_UPDOWN_X + UPDOWN_WH) and
          y >= B_SPED_UP_Y     and y <= (B_SPED_UP_Y     + UPDOWN_WH)
          ret = BALL_SPEED_UP
    elsif x >= B_SPED_UPDOWN_X and x <= (B_SPED_UPDOWN_X + UPDOWN_WH) and
          y >= B_SPED_DW_Y     and y <= (B_SPED_DW_Y     + UPDOWN_WH)
          ret = BALL_SPEED_DOWN
    elsif x >= B_NUMB_UPDOWN_X and x <= (B_NUMB_UPDOWN_X + UPDOWN_WH) and
          y >= B_NUMB_UP_Y     and y <= (B_NUMB_UP_Y     + UPDOWN_WH)
          ret = BALL_NUMBER_UP
    elsif x >= B_NUMB_UPDOWN_X and x <= (B_NUMB_UPDOWN_X + UPDOWN_WH) and
          y >= B_NUMB_DW_Y     and y <= (B_NUMB_DW_Y     + UPDOWN_WH)
          ret = BALL_NUMBER_DOWN
    elsif x >= FINISH_X and x <= (FINISH_X + @btn_owari.width) and
          y >= FINISH_Y and y <= (FINISH_Y + @btn_owari.height)
          ret = FINISH_BUTTON
    elsif x >= MIRU_X   and x <= (MIRU_X   + @btn_miru.width) and
          y >= W_MIRU_Y and y <= (W_MIRU_Y + @btn_miru.height)
          ret = WINDOW_BUTTON
    elsif x >= MIRU_X   and x <= (MIRU_X   + @btn_miru.width) and
          y >= B_MIRU_Y and y <= (B_MIRU_Y + @btn_miru.height)
          ret = BALL_BUTTON
    elsif x >= ZIKKOU_X and x <= (ZIKKOU_X + @btn_zikkou.width) and
          y >= ZIKKOU_Y and y <= (ZIKKOU_Y + @btn_zikkou.height)
          ret = ZIKKOU_BUTTON
          @zikkou_click_count += 1
    elsif x >= SECRET1_X and x <= (SECRET1_X + @btn_secret1.width) and
          y >= SECRET_Y  and y <= (SECRET_Y  + @btn_secret1.height) and @is_secret1
          ret = SECRET1_BUTTON
          @zikkou_click_count += 1
    elsif x >= SECRET2_X and x <= (SECRET2_X + @btn_secret2.width) and
          y >= SECRET_Y  and y <= (SECRET_Y  + @btn_secret2.height) and @is_secret2
          ret = SECRET2_BUTTON
    elsif x >= SECRET3_X and x <= (SECRET3_X + @btn_secret3.width) and
          y >= SECRET_Y  and y <= (SECRET_Y  + @btn_secret3.height) and @is_secret3
          ret = SECRET3_BUTTON
    elsif y >= W_COLR_Y and y <= (W_COLR_Y + BOX_H)
          if x >= COLOR1_X  and x <= (COLOR1_X + BOX_W1)
             ret = WINDOW_COLOR1
          elsif x >= COLOR2_X  and x <= (COLOR2_X + BOX_W1)
                ret = WINDOW_COLOR2
          elsif x >= COLOR3_X  and x <= (COLOR3_X + BOX_W1)
                ret = WINDOW_COLOR3
          elsif x >= COLOR4_X  and x <= (COLOR4_X + BOX_W1)
                ret = WINDOW_COLOR4
          elsif x >= COLOR5_X  and x <= (COLOR5_X + BOX_W1)
               ret = WINDOW_COLOR5
          end
    elsif y >= B_COLR_Y and y <= (B_COLR_Y + BOX_H)
          if x >= COLOR1_X  and x <= (COLOR1_X + BOX_W1)
             ret = BALL_COLOR1
          elsif x >= COLOR2_X  and x <= (COLOR2_X + BOX_W1)
                ret = BALL_COLOR2
          elsif x >= COLOR3_X  and x <= (COLOR3_X + BOX_W1)
                ret = BALL_COLOR3
          elsif x >= COLOR4_X  and x <= (COLOR4_X + BOX_W1)
                ret = BALL_COLOR4
          elsif x >= COLOR5_X  and x <= (COLOR5_X + BOX_W1)
                ret = BALL_COLOR5
          elsif x >= COLOR6_X  and x <= (COLOR6_X + BOX_W1)
                ret = BALL_COLOR6
          elsif x >= COLOR7_X  and x <= (COLOR7_X + BOX_W1)
                ret = BALL_COLOR7
          elsif x >= COLOR8_X  and x <= (COLOR8_X + BOX_W1)
                ret = BALL_COLOR8
          end
    end

    return ret
  end
end

