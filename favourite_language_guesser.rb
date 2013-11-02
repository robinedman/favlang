require_relative 'github_api'

class FavouriteLanguageGuesser
  def favourite_language(username)
    used_languages(username).max_by { |language, times_used | times_used }.first
  end

  def used_languages(username)
    user_repos = GitHubAPI.get_user_repos(username).group_by { |repo| repo['language']}
    Hash[user_repos.keys.map { |language| [language, user_repos[language].count]}]
  end
end
