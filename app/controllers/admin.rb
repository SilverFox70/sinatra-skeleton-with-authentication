get '/admin'  do
  @user = current_user
  if @user.is_admin?
    @all_users = User.all
    erb :admin
  else
    erb :not_authorized
  end
end
