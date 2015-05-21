class MoviesController < ApplicationController
    def new
        @movie = Movie.new
    end
    
    def create
        @movie = Movie.new(movie_params)
        
        if @movie.save
            redirect_to new_movie_path, notice: "Movie Saved!"
        else
            redirect_to new_movie_path, notice: "Error occurred"
        end
        
    end
    
    def show
    end
    
    def edit
        @movie = Movie.find(movie_params)
    end
    
    def update
        if @movie.update(movie_params)
            redirect_to @movie, notice: 'Your movie was successfully updated.'
        else
            render :edit
        end
    end
    
    def index
        @movies = Movie.all
    end
    
    private
        def movie_params
            params.require(:movie).permit(:title, :format, :length, :release_year, :rating)
        end
end