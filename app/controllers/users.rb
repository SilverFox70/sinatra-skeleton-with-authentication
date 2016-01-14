get '/users/new' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    redirect "/users/#{@user.id}"
  else
    erb :register
  end
end

post '/users/new' do
  @user = User.new(first_name: params[:first_name],
                   last_name: params[:last_name],
                   email:  params[:email],
                   password: params[:password_plaintext])
  #@user.password = params[:password_plaintext]
  if @user.save
    session[:user_id] = @user.slug
    redirect '/'
  else
    @errors = @user.errors.full_messages
    erb :register
  end
end

get '/users/profile/edit/:user_id' do
  # if current_user is the same as the person who navigated
  # here, present them with a form to edit their profile
  # otherwise tell them they are not authorized to edit
  "Hello world stub"
end

get '/users/profile/:user_id' do
  @logged_in_as = User.find_by(slug: session[:user_id]) if session[:user_id]
  @viewing_user = User.find_by(slug: params[:user_id])

  if @logged_in_as && @logged_in_as.id == @viewing_user.id
    # Stub for creating a profile page.
    # Add routing to bring a user to their unique profile
    erb :user_id
  else
    erb :not_authorized
  end
end


