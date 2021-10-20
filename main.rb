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

    @logo_url='https://under2.global/images/email-sig.png'
    @logo_base64=File.read('logo_base64.txt')

    html =  File.read('the_html.txt')
    html.gsub!("###phone###", @phone)
    html.gsub!("###email###", @email)
    html.gsub!("###title###",@title)
    html.gsub!("###name###",@name)
    html.gsub!("###image###",@logo_url)

    @html = html
    @escaped_html = CGI.escapeHTML(html)

    html64 =  File.read('the_html.txt')
    html64.gsub!("###phone###", @phone)
    html64.gsub!("###email###", @email)
    html64.gsub!("###title###",@title)
    html64.gsub!("###name###",@name)
    html64.gsub!("###image###",@logo_base64)

    @html64 = html64
    @escaped_html64 = CGI.escapeHTML(html64)

    erb :index
  end
end
