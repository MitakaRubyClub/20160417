#!ruby -Ks
# -*- coding: Windows-31J -*-
require "fileutils"
require_relative "HenkouGamenParam"

class HenkouGamenFile
  def update_files(p)
    FileUtils.copy("../game/GameWaku.rb", "../game/GameWaku.bak")
    open("../game/GameWaku.bak") do |source|
      open("../game/GameWaku.rb", "w") do |dest|
        line = source.read
        line.sub!(/WAKU_YOKO = \d{1,}/, "WAKU_YOKO = #{p.window_size}")
        line.sub!(/WAKU_TATE = \d{1,}/, "WAKU_TATE = #{p.window_size}")
        line.sub!(/WAKU_COLOR = \[\d{1,},\d{1,},\d{1,}\]/, "WAKU_COLOR = #{p.window_color_name}")
        if p.ball_color_name == ""
           line.gsub!("BallMaru", "BallGazou")
        else
           line.gsub!("BallGazou", "BallMaru")
        end
        if p.secret3
           line.sub!("# @color = @secret.color_henkou(@color)", "  @color = @secret.color_henkou(@color)")
        else
           line.sub!("  @color = @secret.color_henkou(@color)", "# @color = @secret.color_henkou(@color)")
        end
        dest.write(line)
      end
    end

    if p.ball_color_name == ""
       fileName = "BallGazou"
    else
       fileName = "BallMaru"
    end

    FileUtils.copy("../game/" + fileName + ".rb", "../game/" + fileName + ".bak")
    open("../game/" + fileName + ".bak") do |source|
      open("../game/" + fileName + ".rb", "w") do |dest|
        line = source.read
        if p.ball_color_name == ""
           file_name = '"' + p.ball_file_name + '"'
           line.sub!(/BALL_GAZOU = \S{1,}/, "BALL_GAZOU = #{file_name}")
        else
           line.sub!(/BALL_COLOR = \[\d{1,},\d{1,},\d{1,}\]/, "BALL_COLOR = #{p.ball_color_name}")
           line.sub!(/BALL_HANKEI = \d{1,}/, "BALL_HANKEI = #{p.ball_size}")
        end
        line.sub!(/BALL_SPEED = \d{1,}/, "BALL_SPEED = #{p.ball_speed}")
        line.sub!(/BALL_KAZU = \d{1,}/, "BALL_KAZU = #{p.ball_num}")
        if p.secret1
           line.sub!("# @hankei = @secret.size_henkou(@hankei)", "  @hankei = @secret.size_henkou(@hankei)")
           line.sub!("# @ritu = @secret.size_henkou(@ritu)",     "  @ritu = @secret.size_henkou(@ritu)")
        else
           line.sub!("  @hankei = @secret.size_henkou(@hankei)", "# @hankei = @secret.size_henkou(@hankei)")
           line.sub!("  @ritu = @secret.size_henkou(@ritu)",     "# @ritu = @secret.size_henkou(@ritu)")
        end
        if p.secret2
           line.sub!("# @speed = @secret.speed_henkou(@speed)", "  @speed = @secret.speed_henkou(@speed)")
        else
           line.sub!("  @speed = @secret.speed_henkou(@speed)", "# @speed = @secret.speed_henkou(@speed)")
        end
        dest.write(line)
      end
    end
  end
end

