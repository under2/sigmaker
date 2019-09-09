require 'sinatra'
require 'cgi'

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

    html =  File.read('the_html.txt')
    html.gsub!("###phone###", @phone)
    html.gsub!("###email###", @email)
    html.gsub!("###title###",@title)
    html.gsub!("###name###",@name)

    @html = html
    @escaped_html = CGI.escapeHTML(html)
    erb :index
  end
end
