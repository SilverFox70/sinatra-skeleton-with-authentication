get '/' do
  if session[:user_id]
    @user = User.find(session[:user_id])
  end
  erb :index
end

get '/secret' do
  redirect '/sessions/new' unless session[:user_id]
  "Secret Area!"
end
