#!ruby -Ks
# -*- coding: Windows-31J -*-
require_relative "GameWaku"
require_relative "Secret"

class Ball
  # 作成時
  def initialize(waku)
    @secret     = Secret.new
    @waku       = waku
    @yoko_houkou = "right"
    @tate_houkou = "sita"
    @gizagiza   = 0
    @otiru      = 0
  end

  # 横に移動
  def yoko_idou(left, size)
    if @yoko_houkou == "right"
       @yoko_iti = @yoko_iti + @speed
    else
       @yoko_iti = @yoko_iti - @speed
    end
    if @yoko_iti <= left
       @yoko_houkou = "right"
    end
    if @yoko_iti >= (GameWaku::WAKU_YOKO - size)
       @yoko_houkou = "left"
    end
  end

  # たてに移動
  def tate_idou(ue, size)
    if @tate_houkou == "sita"
       @tate_iti = @tate_iti + @speed
    else
       @tate_iti = @tate_iti - @speed
    end
    if @tate_iti <= ue
       @tate_houkou = "sita"
    end
    if @tate_iti >= (GameWaku::WAKU_TATE - size)
       @tate_houkou = "ue"
     end
  end

  # 横に移動（くっつく）
  def yoko_idou_harituki(left, size)
    if @yoko_houkou == "right"
       @yoko_iti = @yoko_iti + @speed
    else
       @yoko_iti = @yoko_iti - @speed
    end
    if @yoko_iti <= left
       @yoko_houkou = "right"
       harituku
    end
    if @yoko_iti >= (GameWaku::WAKU_YOKO - size)
       @yoko_houkou = "left"
       harituku
    end
  end

  # たてに移動（くっつく）
  def tate_idou_harituki(ue, size)
    if @tate_houkou == "sita"
       @tate_iti = @tate_iti + @speed
    else
       @tate_iti = @tate_iti - @speed
    end
    if @tate_iti <= ue
       @tate_houkou = "sita"
       harituku
    end
    if @tate_iti >= (GameWaku::WAKU_TATE - size)
       @tate_houkou = "ue"
       harituku
    end
  end

  def harituku
    number = rand 5
    if number == 0
       @speed = 0
    end
  end

  # 横に移動（ぎざぎざ）
  def yoko_idou_gizagiza(left, size)
    @gizagiza = @gizagiza + 0.1
    speed = @speed - @gizagiza
    if @yoko_houkou == "right"
       @yoko_iti = @yoko_iti + speed
    else
       @yoko_iti = @yoko_iti - speed
    end
    if @yoko_iti <= left or speed <= 0
       @yoko_houkou = "right"
       @gizagiza = 0
    end
    if @yoko_iti >= (GameWaku::WAKU_YOKO - size) or speed <= 0
       @yoko_houkou = "left"
       @gizagiza = 0
    end
  end

  # たてに移動（ぎざぎざ）
  def tate_idou_gizagiza(ue, size)
    @gizagiza = @gizagiza + 0.1
    speed = @speed - @gizagiza
    if @tate_houkou == "sita"
       @tate_iti = @tate_iti + speed
    else
       @tate_iti = @tate_iti - speed
    end
    if @tate_iti <= ue or speed <= 0
       @tate_houkou = "sita"
       @gizagiza = 0
    end
    if @tate_iti >= (GameWaku::WAKU_TATE - size) or speed <= 0
       @tate_houkou = "ue"
       @gizagiza = 0
    end
  end

  # たてに移動（落ちる）
  def tate_idou_otiru(ue, size)
    if @tate_houkou == "sita"
       @otiru = @otiru + 0.2
       @tate_iti = @tate_iti + @speed + @otiru
    else
       @otiru = @otiru - 0.2
       @tate_iti = @tate_iti - @speed - @otiru
    end
    if @tate_iti <= ue
       @tate_houkou = "sita"
    end
    if @tate_iti >= (GameWaku::WAKU_TATE - size)
       @tate_houkou = "ue"
       @tate_iti = GameWaku::WAKU_TATE - size
       @otiru = 6.5
    end
  end

end

