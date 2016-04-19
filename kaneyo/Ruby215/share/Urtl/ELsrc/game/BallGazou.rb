#!ruby -Ks
# -*- coding: Windows-31J -*-
require_relative "Ball"

class BallGazou < Ball
  BALL_SPEED = 5		# ����
  BALL_KAZU = 9			# ��
  BALL_GAZOU = "./gazou/1.png"	# �G�̃t�@�C��

  # �쐬��
  def initialize(waku)
    super
    @ritu    = 1
    @gazou   = @waku.gazou_zyunbi(File.dirname(__FILE__) + "/" + BALL_GAZOU, [255,255,255])
    @speed  = BALL_SPEED * 2.0
    @yoko_iti = rand(GameWaku::WAKU_YOKO - @gazou.width)		# �G�̉��ʒu
    @tate_iti = rand(GameWaku::WAKU_TATE - @gazou.height)		# �G�̂��Ĉʒu
  end

  # �{�[���𓮂���
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

