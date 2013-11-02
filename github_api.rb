require 'uri'
require 'net/http'
require 'json'

module GitHubAPI
  class UserNotFoundError < StandardError
    def self.not_found?(response)
      response == self.not_found_response
    end

    def self.not_found_response
      {
        "message" => "Not Found",
        "documentation_url" => "http://developer.github.com/v3"
      }
    end
  end

  def self.get_user_repos(username)
      uri = URI("https://api.github.com/users/#{username}/repos")
      response = JSON.parse(Net::HTTP.get(uri))
      raise UserNotFoundError if UserNotFoundError.not_found?(response)
      response
    end
end
