#!ruby -Ks
# -*- coding: Windows-31J -*-
require_relative "BallMaru"

class MyBall < BallMaru
  # 作成時
  def initialize(waku)
    super
#---  色をさいころで決める
#     @color = @secret.color_saikoro
  end

  # ボールを動かす
  def ugoku
#--- 大きくなる
#   @hankei = @secret.size_henkou(@hankei)
#--- 速くなる
#   @speed = @secret.speed_henkou(@speed)
#--- 色が変わる
#   @color = @secret.color_henkou(@color)
#--- 大きくなってからちぢむ
#   @hankei = @secret.ookiku_kara_tizimu(@hankei)
#--- 速くなって止まる
#   @speed = @secret.hayaku_kara_tomaru(@speed)
#--- ふつうの移動
    yoko_idou(@hankei, @hankei)
    tate_idou(@hankei, @hankei)
#---
    @waku.maru(@yoko_iti, @tate_iti, @hankei, @color)
    return false
  end

end

