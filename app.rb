require 'sinatra'
require 'json'
require_relative 'lib/favourite_language_guesser'

language_guesser = FavouriteLanguageGuesser.new

get '/' do
  send_file('./public/index.html')
end

# User's favourite programming language
get '/:username/favourite' do |username|
  begin
    favourite_language = language_guesser.favourite_language(username)
  rescue GitHubAPI::GitHubAPIError => e
    status 404
    e.message
  else
    content_type :json    
    {
      favourite: favourite_language,
      username: username
    }.to_json
  end
end
