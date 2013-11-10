require 'sinatra'
require 'json'
require_relative 'favourite_language_guesser'

language_guesser = FavouriteLanguageGuesser.new

get '/' do
  send_file('./views/index.html')
end

# User's favourite programming language
get '/:username/favourite' do |username|
  content_type :json

  {
    favourite: language_guesser.favourite_language(username),
    username: username
  }.to_json
end
