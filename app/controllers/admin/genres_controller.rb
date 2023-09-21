class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!
  
  def create
    @genre = Genre.new(genre_params)
    @genre.save
    redirect_to request.referer
  end
  
  def new
    @genge = Genre.new
  end  
    
  def index
    @genres = Genre.all
  end
  
  def edit
    @genre = Genre.find(params[:id])
  end  
  
  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    redirect_to 
  end
  
  def destroy
    @genre = Genre.find(params[:id])
    @genre.destroy
    redirect_to 
    
  end
  
  peivate
  
  def genre_params
    params.requier(:genre).permit(:name)
  end  
  
  
end
