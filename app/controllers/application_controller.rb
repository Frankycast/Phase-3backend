class ApplicationController < Sinatra::Base
  register Sinatra::CrossOrigin

  configure do
    enable :cross_origin
    set :allow_origin, "*" 
    set :allow_methods, [:get, :post, :patch, :delete, :options] # allows these HTTP verbs
    set :expose_headers, ['Content-Type']
  end

  options "*" do
    response.headers["Allow"] = "HEAD,GET,PUT,POST,DELETE,OPTIONS"
    response.headers["Access-Control-Allow-Headers"] = "X-Requested-With, X-HTTP-Method-Override, Content-Type, Cache-Control, Accept"
    200
  end

  # method "URL" do
    
  # end

  get "/users" do 
    User.all.to_json(include: :scores)
  end

  post "/login" do
    user = User.find_by(username: params[:username], password: params[:password])

    if user
      user.to_json(include: :scores) 
     
    else
       {error: "Incorrect username or password."}.to_json 
    end
  end

  post "/scores" do 
    Score.all.to_json
  end

  post "/signup" do

    user = User.new(params)
    #Find if there is a user with the params username
    #If there is not, then the new user can be added to the database
    if user.username.blank? || user.password.blank? 
      {error: "Invalid or password. Try again."}.to_json
    #If there is, throw an error message
    else
      user.save()
      user.to_json(include: :scores) 
    end

  end

end
