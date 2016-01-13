get '/users/new' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    redirect "/users/#{@user.id}"
  else
    erb :register
  end
end

post '/users/new' do
  @user = User.new(f_name: params[:f_name],
                   l_name: params[:l_name],
                   email:  params[:email])
  @user.password = params[:pwd_plaintext]
  if @user.save
    session[:user_id] = @user.id
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :register
  end
end

get '/users/:user_id' do
  @logged_in_as = User.find(session[:user_id]) if session[:user_id]
  @viewing_user = User.find(params[:user_id])

  if @logged_in_as && @logged_in_as.id == @viewing_user.id
    erb :user_id
  else
    erb :not_authorized
  end
end


