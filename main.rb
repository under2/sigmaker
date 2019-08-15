require 'sinatra'

class App < Sinatra::Base
  get "/" do
    "Hello world!"
  end
end



# Choices = {
#   'HAM' => 'Hamburger',
#   'PIZ' => 'Pizza',
#   'CUR' => 'Curry',
#   'NOO' => 'Noodles',
# }

# get '/' do
#   erb :index
# end

# post '/cast' do
#   <<-HTML
#       Hello #{params.inspect}
#     HTML
# end

