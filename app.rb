require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require './models'

enable :sessions

helpers do
    def current_user
        User.find_by(id: session[:user])
    end
end

get '/' do
    erb :account
end

get '/signin' do
    erb :sign_in
end

get '/signup' do
    erb :sign_up
end

post '/signin' do
    user = User.find_by(name: params[:name])
    if user && user.authenticate(params[:password])
        session[:user] = user.id
    
        redirect '/home/todo'
    end
    
    redirect '/signin'
end

post '/signup' do
    user = User.create(name: params[:name],password: params[:password],
    password_confirmation: params[:password_confirmation])
    
    if user.persisted?
        session[:user] = user.id
        
        redirect '/home/todo'
    end
   redirect '/signup'
end

get '/signout' do
    session[:user] = nil
    redirect '/'
end

post '/home/todo'do
    Homework.create(
        homework_name: params[:homework_name],
        homework_range: params[:homework_range],
        homework_deadline: params[:homework_deadline],
        userID: params[:userID]
        )
        
    redirect '/home/todo'
end

get '/home/todo' do
    @homework = Homework.all
    erb :home_todo
end

get '/add' do
    erb :add
end

private
    def login_check
        return redirect '/' unless session[:user]
    end
