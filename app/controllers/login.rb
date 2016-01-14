get '/login' do
  erb :login
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

post '/login' do
  erb :welcome
end


