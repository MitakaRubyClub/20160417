#!ruby -Ks
# -*- coding: Windows-31J -*-
require "dxruby"

class Waku 
  TOZIRU_SOUSA    = K_ESCAPE  
  KURIKKU_SOUSA   = M_LBUTTON  
  HIDARI_YAZIRUSI = K_LEFTARROW  
  MIGI_YAZIRUSI   = K_RIGHTARROW  
  UE_YAZIRUSI     = K_UPARROW  
  SITA_YAZIRUSI   = K_DOWNARROW  
  SPACE           = K_SPACE  

  def initialize(width, height)
    @screen = Image.new(width, height)
    @font = Font.new(24)
  end

  # 画像のロード（引数：画像ファイル名、カラーキー　戻り値：画像オブジェクト）
  def gazou_zyunbi(imgfile, colorkey)
    @image = Image.load(imgfile)
    @image.set_color_key(colorkey)
    return @image
  end

  # 画像表示（引数：画像オブジェクト、X座標、Y座標）
  def gazou(img, x, y, scale=1)
    if scale == 1
      @screen.draw(x, y, img)
    else
      gazou_ookiku(img, x, y, scale)
    end
  end

  # 画像拡大（引数：画像オブジェクト、X座標、Y座標、拡大率）
  def gazou_ookiku(img, x, y, scale)
    Window.draw_scale(x,y,img,scale,scale,0,0)
  end

  # 中を塗りつぶした四角形（引数：X座標、Y座標、幅、高さ、色）
  def sikaku(x, y, w, h, c)
    x2 = x + w
    y2 = y + h
    @screen.box_fill(x, y, x2, y2, c)
  end

  # 枠だけの四角形（引数：X座標、Y座標、幅、高さ、色）
  def sikaku_waku(x, y, w, h, c)
    x2 = x + w
    y2 = y + h
    @screen.box(x, y, x2, y2, c)
  end

  # 丸（引数：中心のX座標、中心のY座標、半径、色）
  def maru(x, y, r, c)
    @screen.circle_fill(x,y,r,c)
  end

  # 英数字の文字のロード（引数：フォントサイズ　戻り値：フォントオブジェクト）
  def suuzi_zyunbi(fontsize)
    Font.new(fontsize,"Arial.ttf")
  end

  # 英数字の文字（引数：フォントオブジェクト、文字列、X座標、Y座標、色）
  def suuzi(font, word, x, y, c)
    @screen.draw_font(x, y, word,@font,c)
  end
end
