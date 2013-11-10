require "minitest/autorun"
require_relative '../favourite_language_guesser'

class FavouriteLanguageGuesserTest < MiniTest::Unit::TestCase
  def setup
    @lg = FavouriteLanguageGuesser.new
  end

  def test_favourite_language_is_the_most_used_language
    assert_equal('Ruby', @lg.favourite_language('rubinius'))
  end

  def test_no_repositories_updated_raises_exception
    assert_raises(FavouriteLanguageGuesser::NoUpdatedRepositoriesWithinTimeframeError) do
      @lg.favourite_language('whymirror', 12)
    end
  end

  def test_favourite_language_since_x_months_ago
    assert_equal('Ruby', @lg.favourite_language('rubinius', 6))
  end

  def test_nonexistent_username_raises_exception
    assert_raises(GitHubAPI::UserNotFoundError) do 
      @lg.favourite_language('auserthatdoesnotexist')
    end
  end
end
