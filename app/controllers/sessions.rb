get '/sessions/new' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    redirect "/users/#{@user.id}"
  else
    erb :login
  end
end

# Route the user to the homepage on successful login,
# otherwise return them to the login page
post '/sessions/new' do
  @user = User.find_by_email(params[:email])
  if @user && @user.authenticate(params[:email], params[:password_plaintext])
    session[:user_id] = @user.slug
    redirect '/'
  else
    session.delete(:user_id)
    @error = "Please check your email address and password and try again."
    erb :login
  end
end

get '/logout' do
  session.delete(:user_id)
  redirect '/'
end

post '/login' do
  erb :welcome
end
