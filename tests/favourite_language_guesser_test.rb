require "minitest/autorun"
require_relative '../lib/favourite_language_guesser'

class FavouriteLanguageGuesserTest < MiniTest::Unit::TestCase
  def setup
    @lg = FavouriteLanguageGuesser.new
  end

  def test_favourite_language_is_the_most_used_language
    assert_equal('Ruby', @lg.favourite_language('rubinius'))
  end

  def test_favourite_language_with_nonexistent_username_raises_exception
    assert_raises(GitHubAPI::UserNotFoundError) do 
      @lg.favourite_language('auserthatdoesnotexist')
    end
  end

  def test_used_languages_raises_exception_when_no_repositories_updated
    assert_raises(FavouriteLanguageGuesser::NoUpdatedRepositoriesWithinTimeframeError) do
      @lg.used_languages('whymirror', 12)
    end
  end

  def test_used_languages_since_x_months_ago
    assert_instance_of(Hash, @lg.used_languages('rubinius', 6))
  end  
end
