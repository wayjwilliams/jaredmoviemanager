class MoviesController < ApplicationController
    before_action :set_movie, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show]
    before_action :correct_user, only: [:edit, :update, :destroy]
    
    def new
        @movie = current_user.movies.build
    end
    
    def create
        @movie = current_user.movies.build(movie_params)
        
        if @movie.save
            flash[:success] = "Movie Saved!"
            redirect_to new_movie_path
        else
            flash[:danger] = "Uh oh, Q. Fill out all the fields"
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
        def set_movie
            @movie = Movie.find_by(id: params[:id])
        end
        
        def correct_user
            @movie = current_user.movies.find_by(id: params[:id])
        end
        
        def movie_params
            params.require(:movie).permit(:title, :format, :length, :release_year, :rating)
        end
end