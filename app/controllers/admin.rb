get '/admin'  do
  @user = current_user
  if @user.is_admin?
    @all_users = User.all
    @at_admin = true
    erb :admin
  else
    erb :not_authorized
  end
end

delete '/profiles/:user_id' do
  this_profile = User.find_by(slug: params[:user_id])
  @id = this_profile.id
  this_profile.destroy
  if request.xhr?
    {id: @id}.to_json
  else
    redirect '/admin'
  end
end
