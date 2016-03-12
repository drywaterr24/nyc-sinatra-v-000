class FiguresController < ApplicationController


  get '/figures' do
    erb :'figures/index'
  end



  get '/figures/new' do
    erb :'figures/new'
  end

  get '/figures/:id' do
    @figure = Figure.find(params[:id])
    erb :'figures/show'
  end

  get '/figures/:id/edit' do
    @figure = Figure.find(params[:id])
    erb :'figures/edit'
  end

  post '/figures/:id' do
    @figure = Figure.find(params[:id])
    if !params[:figure][:name].empty?
    @figure.name =  params[:figure][:name]
   end
   if !params[:landmark][:name].empty?
    @figure.landmarks << Landmark.find_or_create_by(name: params[:landmark][:name])
   end
   @figure.save
   redirect to "/figures/#{@figure.id}"
  end



  post '/figures' do
    @figure = Figure.create(params[:figure])
    if !params[:title][:name].empty?
      title = Title.create(params[:title])
      @figure.titles << title
    end
    if !params[:landmark][:name].empty?
      landmark = Landmark.create(params[:landmark])
      @figure.landmarks << landmark
    end

  end

end
