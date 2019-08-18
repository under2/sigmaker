require 'sinatra'

class App < Sinatra::Base
 get '/' do
  @show_sig = false
  erb :index
 end

 post '/show' do
  @show_sig = true
  @name = params[:user_name]
  @title = params[:user_title]
  @email = params[:user_email]
  @phone = params[:user_phone]
  erb :index
 end
end