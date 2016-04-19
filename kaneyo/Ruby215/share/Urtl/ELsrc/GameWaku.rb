#!ruby -Ks
# -*- coding: Windows-31J -*-
require_relative "./kihon/Waku"
require_relative "BallMaru"
require_relative "Secret"

class GameWaku < Waku
  WAKU_YOKO = 600			# 横の大きさ
  WAKU_TATE = 600			# たての大きさ
  WAKU_COLOR = [0,0,0]		        # 色
  Window.width = WAKU_YOKO
  Window.height = WAKU_TATE

  # 作成時
  def initialize(yoko=WAKU_YOKO, tate=WAKU_TATE)
    super
    @secret = Secret.new
    @color = WAKU_COLOR
    @finish = false		# 終わりスイッチ
  end

  # ボールを作成
  def ball_sakusei
    @ball = Array.new(BallMaru::BALL_KAZU){ BallMaru.new(self) }
  end

  # 背景をかく
  def haikei
    # @color = @secret.color_henkou(@color)
    sikaku(0, 0, WAKU_YOKO, WAKU_TATE, @color)
    Window.draw(0,0,@screen)
  end

  # ボールを動かす
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
