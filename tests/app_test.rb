ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/dsl'
require "minitest/autorun"
require_relative '../app'

class AppTest < MiniTest::Unit::TestCase
  include Capybara::DSL
  # Capybara.default_driver = :selenium # <-- use Selenium driver

  def setup
    Capybara.app = Sinatra::Application.new
    visit('/')
  end

  # def test_it_works
  #   assert(page.has_content?('Favourite Language Guesser'))
  # end

  # def test_get_favourite_language
  #   username = 'rubinius'
  #   fill_in('GitHub username', :with => username)
  #   click_button('Find favourite language')
  #   assert(page.has_content?('favourite language seems to be'))
  # end
end
