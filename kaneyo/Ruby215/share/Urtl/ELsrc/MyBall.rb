#!ruby -Ks
# -*- coding: Windows-31J -*-
require_relative "BallMaru"

class MyBall < BallMaru
  # 作成時
  def initialize(waku)
    super

  end

  # ボールを動かす
  def ugoku
    yoko_idou(@hankei, @hankei)
    tate_idou(@hankei, @hankei)
    @waku.maru(@yoko_iti, @tate_iti, @hankei, @color)
    return false
  end

end

