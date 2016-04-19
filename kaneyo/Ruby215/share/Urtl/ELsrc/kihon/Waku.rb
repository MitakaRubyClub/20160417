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

  # �摜�̃��[�h�i�����F�摜�t�@�C�����A�J���[�L�[�@�߂�l�F�摜�I�u�W�F�N�g�j
  def gazou_zyunbi(imgfile, colorkey)
    @image = Image.load(imgfile)
    @image.set_color_key(colorkey)
    return @image
  end

  # �摜�\���i�����F�摜�I�u�W�F�N�g�AX���W�AY���W�j
  def gazou(img, x, y, scale=1)
    if scale == 1
      @screen.draw(x, y, img)
    else
      gazou_ookiku(img, x, y, scale)
    end
  end

  # �摜�g��i�����F�摜�I�u�W�F�N�g�AX���W�AY���W�A�g�嗦�j
  def gazou_ookiku(img, x, y, scale)
    Window.draw_scale(x,y,img,scale,scale,0,0)
  end

  # ����h��Ԃ����l�p�`�i�����FX���W�AY���W�A���A�����A�F�j
  def sikaku(x, y, w, h, c)
    x2 = x + w
    y2 = y + h
    @screen.box_fill(x, y, x2, y2, c)
  end

  # �g�����̎l�p�`�i�����FX���W�AY���W�A���A�����A�F�j
  def sikaku_waku(x, y, w, h, c)
    x2 = x + w
    y2 = y + h
    @screen.box(x, y, x2, y2, c)
  end

  # �ہi�����F���S��X���W�A���S��Y���W�A���a�A�F�j
  def maru(x, y, r, c)
    @screen.circle_fill(x,y,r,c)
  end

  # �p�����̕����̃��[�h�i�����F�t�H���g�T�C�Y�@�߂�l�F�t�H���g�I�u�W�F�N�g�j
  def suuzi_zyunbi(fontsize)
    Font.new(fontsize,"Arial.ttf")
  end

  # �p�����̕����i�����F�t�H���g�I�u�W�F�N�g�A������AX���W�AY���W�A�F�j
  def suuzi(font, word, x, y, c)
    @screen.draw_font(x, y, word,@font,c)
  end
end
