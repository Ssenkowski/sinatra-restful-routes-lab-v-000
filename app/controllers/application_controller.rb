require "./config/environment"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes'
  get '/recipes/new' do
    erb :"/recipes/new"
  end

  post '/recipes/new' do
    recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    recipe.save
    
    redirect to '/recipes'
  end

  get '/recipes/edit'