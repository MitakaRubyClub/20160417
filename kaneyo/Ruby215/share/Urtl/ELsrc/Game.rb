#!ruby -Ks
# -*- coding: Windows-31J -*-
require "dxruby"
require "fileutils"
require_relative "./kihon/Waku"
#require "/kihon/Waku"
require_relative "GameWaku"

Window.caption="�X�[�p�[�{�[�� �v���O����"
# �Q�[���̂킭���쐬
waku = GameWaku.new

# �{�[�����쐬
waku.ball_sakusei

Window.loop do 
  waku.haikei	   	        # �w�i������
  waku.ball_idou		# �{�[���𓮂���

  # �I���X�C�b�`������΃v���O�����I��
  if File.exists?("endSwitch")
    break
  end
	
end
