get '/' do
  if session[:user_id]
    @user = current_user
  end
  @at_home = true
  erb :index
end

get '/secret' do
  redirect '/sessions/new' unless session[:user_id]
  "Secret Area!"
end
