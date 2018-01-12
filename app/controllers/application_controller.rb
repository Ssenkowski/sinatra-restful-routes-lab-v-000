require "./config/environment"

class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes' do
    erb :index
  end

  get '/recipes/new' do
    erb :index
  end

  post '/recipes/new' do
    recipe = Recipe.new(name: params[:name], ingredients: params[:ingredients], cook_time: params[:cook_time])
    recipe.save

    redirect to "/recipes/#{@recipe.id}"
  end

  get '/recipes/edit'
