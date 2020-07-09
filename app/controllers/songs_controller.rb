class SongsController < ApplicationController
    before_action :find_song, only: [:show, :edit, :update, :destroy]

    def index
        @songs = Song.all
    end

    def show
        # @song = Song.find(params[:id])
    end

    def new
        @song = Song.new
    end

    def create
        # byebug
        @song = Song.new(song_params)

        if @song.save
            redirect_to @song #song_path(@song)
        else
            render :new
        end
    end

    def edit
        # @song = Song.find(params[:id])
    end

    def update
        # @song = Song.find(params[:id])
        # binding.pry
        if @song.update(song_params)
            redirect_to @song #song_path(@song)
        else 
            render :edit
        end
    end

    def destroy
        # @song = Song.find(params[:id])
        @song.destroy
        redirect_to :controller => 'songs', :action => 'index'
    end

    private

    def song_params
        params.require(:song).permit(:title, :artist_name, :release_year, :released, :genre)
    end

    def find_song
        @song = Song.find(params[:id])
    end

end