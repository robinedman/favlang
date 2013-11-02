require 'minitest'
require "minitest/autorun"
require_relative '../favourite_language_guesser'

class FavouriteLanguageGuesserTest < Minitest::Test
  def setup
    @lg = FavouriteLanguageGuesser.new
  end

  def test_favourite_language_is_the_most_used_language
    assert_equal('Ruby', @lg.favourite_language('rubinius'))
  end
end
