Favourite Language Guesser
==========================

Makes a best guess of a GitHub user's favourite language. A couple of notes 
about the implementation: 
  - The frontend is a single page application that uses jQuery for the necessary AJAX requests and DOM updates.
  - The backend is a REST API written using Sinatra that returns JSON.
  - The guessing logic is decoupled from the web app.

Get started
------------
Tested with Ruby 2.0. Start by cloning the repo and then run _bundle install_.

 - _ruby app.rb_ starts a local server.
 - _rake test_ runs the test suite.

