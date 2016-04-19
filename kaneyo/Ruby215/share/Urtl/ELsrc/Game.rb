#!ruby -Ks
# -*- coding: Windows-31J -*-
require "dxruby"
require "fileutils"
require_relative "./kihon/Waku"
#require "/kihon/Waku"
require_relative "GameWaku"

Window.caption="スーパーボール プログラム"
# ゲームのわくを作成
waku = GameWaku.new

# ボールを作成
waku.ball_sakusei

Window.loop do 
  waku.haikei	   	        # 背景をかく
  waku.ball_idou		# ボールを動かす

  # 終了スイッチがあればプログラム終了
  if File.exists?("endSwitch")
    break
  end
	
end
