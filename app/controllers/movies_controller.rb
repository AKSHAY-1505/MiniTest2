class MoviesController < ApplicationController
    def index
        @movies = Movie.all
    end

    def new
        @movie = Movie.new
    end

    def create
        @movie = Services::MovieService.new(movie_params).create
        if @movie.errors
            flash[:success] = "Error adding Movie! "
            redirect_to root_path 
        else
            flash[:success] = "Movie Succesfully Added!"
            redirect_to root_path 
        end
    end

    def about
    end

    def edit
        @movie = Movie.find(params[:id])
    end

    def update
        @movie = Services::MovieService.new(movie_params).update(params[:id])
        if @movie.errors
            flash[:success] = "Unable to Edit Movie!" 
            redirect_to root_path 
        else
            flash[:success] = "Movie Succesfully Updated!" 
            redirect_to root_path 
        end
    end

    def destroy
        @movie = Services::MovieService.new().destroy(params[:id])
        if @movie.errors
            flash[:success] = "Unable to Delete Movie!" 
            redirect_to root_path 
        else
            flash[:success] = "Movie Deleted Succesfully!" 
            redirect_to root_path
        end 
    end

    def movie_params
        params.require(:movie).permit(:name,:director,:cast,:language,:cover)
    end
end