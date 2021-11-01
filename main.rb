require 'sinatra'
require 'cgi'

class App < Sinatra::Base
  get '/' do
    @show_sig = false
    erb :index
  end

  post '/show' do

    @show_sig = true
    @name = params[:user_name] || "Default Name"
    @title = params[:user_title] || "Default Title"
    @email = params[:user_email] || "default@email.com"
    @phone = params[:user_phone] || "389472389472389472983"

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
