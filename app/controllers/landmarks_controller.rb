class LandmarksController < ApplicationController

  get "/landmarks" do
    erb :"landmarks/index"
  end

  post "/landmarks" do
    Landmark.create(params[:landmark])
    redirect "/landmarks"
  end

  get "/landmarks/new" do
    erb :"landmarks/new"
  end

  get "/landmarks/:id" do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"landmarks/show"
  end

  patch "/landmarks/:id" do
    Landmark.update(params[:id], params[:landmark])
    redirect "/landmarks/#{params[:id]}"
  end

  get "/landmarks/:id/edit" do
    @landmark = Landmark.find_by_id(params[:id])
    erb :"/landmarks/edit"
  end

end
