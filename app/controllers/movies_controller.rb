class MoviesController < ApplicationController
    def new
        @movie = Movie.new
    end
    
    def create
        @movie = Movie.new(movie_params)
        
        if @movie.save
            flash[:success] = "Movie Saved!"
            redirect_to new_movie_path
        else
            flash[:error] = "Uh oh, Q. Fill out all the fields"
            redirect_to new_movie_path
        end
        
    end
    
    def show
        @movie = Movie.find(params[:id])
    end
    
    def edit
        @movie = Movie.find(params[:id])
    end
    
    def update
        @movie = Movie.find(params[:id])
        if @movie.update(movie_params)
            flash[:success] = 'Good work, Q! Movie successfully updated.'
            redirect_to @movie
        else
            render :edit
        end
    end
    
    def index
        @movies = Movie.all
    end
    
    def destroy
        @movie = Movie.find(params[:id])
        @movie.destroy
        redirect_to :action => 'index'
    end
    
    private
        def movie_params
            params.require(:movie).permit(:title, :format, :length, :release_year, :rating)
        end
end