#!ruby -Ks
# -*- coding: Windows-31J -*-
require_relative "BallMaru"

class MyBall < BallMaru
  # �쐬��
  def initialize(waku)
    super
#---  �F����������Ō��߂�
#     @color = @secret.color_saikoro
  end

  # �{�[���𓮂���
  def ugoku
#--- �傫���Ȃ�
#   @hankei = @secret.size_henkou(@hankei)
#--- �����Ȃ�
#   @speed = @secret.speed_henkou(@speed)
#--- �F���ς��
#   @color = @secret.color_henkou(@color)
#--- �傫���Ȃ��Ă��炿����
#   @hankei = @secret.ookiku_kara_tizimu(@hankei)
#--- �����Ȃ��Ď~�܂�
#   @speed = @secret.hayaku_kara_tomaru(@speed)
#--- �ӂ��̈ړ�
    yoko_idou(@hankei, @hankei)
    tate_idou(@hankei, @hankei)
#---
    @waku.maru(@yoko_iti, @tate_iti, @hankei, @color)
    return false
  end

end

