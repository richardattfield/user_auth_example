# Homepage (Root path)
VALID_USERS = {
  rich: "luna",
  bev: "love",
  derrick: "jd"
}

before do
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
  if VALID_USERS[params["email"].to_sym] == params["password"]
    session[:email] = params[:email]
    redirect '/'
  else
    redirect '/'
  end
end
