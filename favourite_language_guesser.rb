require 'uri'
require 'net/http'
require 'json'

class FavouriteLanguageGuesser
  class UserNotFoundError < StandardError
  end

  def favourite_language(username)
    used_languages(username).max_by { |language, times_used | times_used }.first
  end

  def used_languages(username)
    user_repos = get_user_repos(username).group_by { |repo| repo['language']}
    Hash[user_repos.keys.map { |language| [language, user_repos[language].count]}]
  end

  private

  def get_user_repos(username)
    uri = URI("https://api.github.com/users/#{username}/repos")
    response = Net::HTTP.get(uri)
    JSON.parse(response)
  end
end
