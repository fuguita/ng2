class Admin::GenresController < ApplicationController
  
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
    @genre.update
    redirect_to 
  end
  
  
end
