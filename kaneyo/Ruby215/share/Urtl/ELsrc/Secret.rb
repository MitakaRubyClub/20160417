#!ruby -Ks
# -*- coding: Windows-31J -*-
class Secret
  def initialize
    @suuzi = 0
    @tizinda = 0
    @tomatta = 0
  end

  # 大きくする
  def size_henkou(size)
    return size + 0.1
  end

  # 速くする
  def speed_henkou(speed)
    return speed + 0.01
  end

  # 色を変える
  def color_henkou(color)
    @suuzi = @suuzi + 1
    if @suuzi % 5 == 0
       if color[0] < 255
          color[0] = color[0] + 1
       elsif color[1] < 255
          color[1] = color[1] + 1
       elsif color[2] < 255
          color[2] = color[2] + 1
       else
          color = [0, 0, 0]
       end
    end
    return color
  end

  # 色をさいころで決める
  def color_saikoro
    number = rand 3
    if number    == 0
       color = [255, 0, 0]
    elsif number == 1
       color = [0, 255, 0]
    else
       color = [0, 0, 255]
    end
    return color
  end

  # 大きくなってからちぢむ
  def ookiku_kara_tizimu(size)
    if size >= 200
       @tizinda = 1
    end
    if @tizinda == 1
       return 1
    else
       return size + 0.1
    end
  end

  # 速くなってから止まる
  def hayaku_kara_tomaru(speed)
    if speed >= 20
       @tomatta = 1
    end
    if @tomatta == 1
       return 0
    else
       return speed + 0.01
    end
  end

end

