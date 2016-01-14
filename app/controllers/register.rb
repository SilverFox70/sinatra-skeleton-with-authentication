enable :sessions

get '/register' do
  erb :register
end

# Use the route below if you wish to have users login after registering
# post '/register' do
#   erb :login
# end
