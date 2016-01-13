get '/' do
  erb :index
end

get '/secret' do
  redirect '/sessions/new' unless session[:user_id]
  "Secret Area!"
end
