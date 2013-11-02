require 'sinatra'
require_relative 'favourite_language_guesser'

language_guesser = FavouriteLanguageGuesser.new

get '/' do
  erb :index
end

# User's favourite programming language
get '/:username/favourite' do |username|
  {
    favourite: language_guesser.favourite_language(username),
    username: username
  }.to_json
end
