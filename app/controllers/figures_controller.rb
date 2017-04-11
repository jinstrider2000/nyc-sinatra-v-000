class FiguresController < ApplicationController

  get "/figures" do
    erb :'figures/index'
  end

  post "/figures" do
    new_figure = Figure.create(params[:figure])
    unless params[:title][:name] == ""
      new_figure.titles << Title.create(params[:title])
    end
    unless params[:landmark][:name] == ""
      new_figure.landmarks << Landmark.create(params[:landmark])
    end
    redirect "/figures"
  end

  get "/figures/new" do
    erb :'figures/new'
  end

  get "/figures/:id" do
    @figure = Figure.find_by_id(params[:id])
    erb :'figures/show'
  end

  patch "/figures/:id" do
    Figure.update(params[:id], params[:figure])
    figure = Figure.find_by_id(params[:id])
    unless params[:title][:name] == ""
      figure.titles << Title.create(params[:title])
    end
    unless params[:landmark][:name] == ""
      figure.landmarks << Landmark.create(params[:landmark])
    end
    redirect "figures/#{params[:id]}"
  end

  get "/figures/:id/edit" do
    @figure = Figure.find_by_id(params[:id])
    erb :"figures/edit"
  end

end
