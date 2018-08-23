require 'sinatra'
require 'sinatra/contrib'
require 'sinatra/reloader' if development?

require_relative './controllers/posts-controller.rb'

# direct the request to the correct controller
run PostsController
