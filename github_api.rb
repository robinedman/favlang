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

  class APILimitError < StandardError
    def self.api_limit?(response)
      if response.is_a?(Hash)
        response['documentation_url'] == self.api_limit_reached_response['documentation_url']
      end
    end

    def self.api_limit_reached_response
      {
        "message" => "API rate limit exceeded for...",
        "documentation_url"=>"http://developer.github.com/v3/#rate-limiting"
      }
    end
  end

  def self.get_user_repos(username)
      uri = URI("https://api.github.com/users/#{username}/repos")
      response = JSON.parse(Net::HTTP.get(uri))
      
      raise UserNotFoundError if UserNotFoundError.not_found?(response)
      raise APILimitError if APILimitError.api_limit?(response)

      response
    end
end
