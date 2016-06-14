# Homepage (Root path)

before do
  @current_user = User.find(session[:id]) if session[:id]
  erb :login
end

get '/' do
  erb :index
end

#Show the login form
get '/login' do
  erb :login
end

get '/logout' do
  session.clear
  redirect '/'
end

# Get login input from users
post '/login' do
    user = User.find_by(email: params[:email])
    if user.password == params[:password]
      session[:id] = user.id
    redirect '/'
  else
    redirect '/'
  end
end
