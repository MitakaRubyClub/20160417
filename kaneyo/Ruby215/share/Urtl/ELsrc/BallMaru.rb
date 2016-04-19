#!ruby -Ks
# -*- coding: Windows-31J -*-
require_relative "Ball"

class BallMaru < Ball
  BALL_HANKEI = 10		# 半径
  BALL_COLOR = [255,100,100]    # 色
  BALL_SPEED = 1  		# 速さ
  BALL_KAZU = 1			# 数

  # 作成時
  def initialize(waku)
    super
    @hankei  = BALL_HANKEI
    @color   = BALL_COLOR
    @speed   = BALL_SPEED * 2.0
    @yoko_iti = BALL_HANKEI + rand(GameWaku::WAKU_YOKO - BALL_HANKEI * 2)	# 中心の横位置
    @tate_iti = BALL_HANKEI + rand(GameWaku::WAKU_TATE - BALL_HANKEI * 2)	# 中心のたて位置
  end

  # ボールを動かす
  def ugoku
    # @hankei = @secret.size_henkou(@hankei)
    # @speed = @secret.speed_henkou(@speed)
    yoko_idou(@hankei, @hankei)
    tate_idou(@hankei, @hankei)
    @waku.maru(@yoko_iti, @tate_iti, @hankei, @color)
    if @hankei >= 200 or @speed.abs >= 20
       return true
    else
       return false
    end
  end
end

