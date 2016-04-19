#!ruby -Ks
# -*- coding: Windows-31J -*-
require_relative "Ball"

class BallGazou < Ball
  BALL_SPEED = 5		# 速さ
  BALL_KAZU = 9			# 数
  BALL_GAZOU = "./gazou/1.png"	# 絵のファイル

  # 作成時
  def initialize(waku)
    super
    @ritu    = 1
    @gazou   = @waku.gazou_zyunbi(File.dirname(__FILE__) + "/" + BALL_GAZOU, [255,255,255])
    @speed  = BALL_SPEED * 2.0
    @yoko_iti = rand(GameWaku::WAKU_YOKO - @gazou.width)		# 絵の横位置
    @tate_iti = rand(GameWaku::WAKU_TATE - @gazou.height)		# 絵のたて位置
  end

  # ボールを動かす
  def ugoku
    # @ritu = @secret.size_henkou(@ritu)
    # @speed = @secret.speed_henkou(@speed)
    yoko_idou(0, @gazou.width)
    tate_idou(0, @gazou.height)
    @waku.gazou(@gazou, @yoko_iti, @tate_iti, @ritu)
    if @ritu >= 10 or @speed.abs >= 20
      return true
    else
      return false
    end
  end
end

