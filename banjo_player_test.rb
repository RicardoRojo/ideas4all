require 'minitest/autorun'
require_relative 'banjo_player'

class BanjoPlayerTest < Minitest::Test

  def test_plays_banjo_name_starts_with_r
    banjo_player = BanjoPlayer.new
    assert_equal("robert plays banjo", banjo_player.plays_banjo("robert"))
  end

  def test_plays_banjo_name_starts_with_R
    banjo_player = BanjoPlayer.new
    assert_equal("Robert plays banjo", banjo_player.plays_banjo("Robert"))
  end

  def test_not_plays_banjo_name_not_starts_with_r_or_R
    banjo_player = BanjoPlayer.new
    assert_equal("alice does not play banjo", banjo_player.plays_banjo("alice"))
  end
end