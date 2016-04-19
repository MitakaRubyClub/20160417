#!ruby -Ks
# -*- coding: Windows-31J -*-
require_relative "./kihon/Waku"
require_relative "BallMaru"
require_relative "Secret"

class GameWaku < Waku
  WAKU_YOKO = 600			# ���̑傫��
  WAKU_TATE = 600			# ���Ă̑傫��
  WAKU_COLOR = [0,0,0]		        # �F
  Window.width = WAKU_YOKO
  Window.height = WAKU_TATE

  # �쐬��
  def initialize(yoko=WAKU_YOKO, tate=WAKU_TATE)
    super
    @secret = Secret.new
    @color = WAKU_COLOR
    @finish = false		# �I���X�C�b�`
  end

  # �{�[�����쐬
  def ball_sakusei
    @ball = Array.new(BallMaru::BALL_KAZU){ BallMaru.new(self) }
  end

  # �w�i������
  def haikei
    # @color = @secret.color_henkou(@color)
    sikaku(0, 0, WAKU_YOKO, WAKU_TATE, @color)
    Window.draw(0,0,@screen)
  end

  # �{�[���𓮂���
  def ball_idou
    if @finish == false
      number = 0
      while number < BallMaru::BALL_KAZU
        @finish = @ball[number].ugoku
        number = number + 1
      end

      # @ball.each {|ball| @finish = ball.ugoku}

      if @finish
        @ball = []
      end
    end
  end
end
