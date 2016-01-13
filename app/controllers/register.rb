enable :sessions

get '/register' do
  erb :register
end

post '/register' do
  erb :login
end
