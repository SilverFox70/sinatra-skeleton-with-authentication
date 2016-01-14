def current_user
  @current_user ||= User.find_by(slug: session[:user_id])
end
