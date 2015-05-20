class MoviesController < ApplicationController
    def new
        @movie = Movie.new
    end
    
    def create
        @movie = Movie.new(movie_params)
    end
    
    private
        def movie_params
            params.require(:movie).permit(:title, :format, :length, :release_year, :rating)
        end
end