class SongsController < ApplicationController
    def index
        @songs = Song.all
    end

    def show
        fetch_song
    end

    def edit
        fetch_song
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(attributes)
        if @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def update
        fetch_song
        if @song.update(attributes)
            redirect_to song_path(@song)
        else
            render :edit
        end
    end

    def destroy
        fetch_song.destroy
        redirect_to songs_path
    end

    private

    def fetch_song
        @song = Song.find(params[:id])
    end

    def attributes
        params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
    end
end
