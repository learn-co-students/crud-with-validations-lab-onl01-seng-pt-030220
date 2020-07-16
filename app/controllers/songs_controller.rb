class SongsController < ApplicationController

    def index 
    @songs = Song.all
    end

    def show 
    @song = Song.find(params[:id])
    redirect_to song_path(@song)
    end

    def edit 
    @song = Song.find(params[:id])
    end

    def update 
    @song = Song.find(params[:id])
    @song.update(strong_params(:title,:genre,:artist_name,:released,:release_year))
    if @song.valid? 
        @song.save 
        redirect_to song_path(@song) 
    else
        render :edit 
    end
    end

    def new 
    @song = Song.new
    end

    def create 
    @song = Song.new(strong_params(:title,:genre,:artist_name,:released,:release_year))
    if @song.valid? 
        @song.save 
        redirect_to song_path(@song)
    else
        render :new
    end
    end

    def destroy 
    Song.find(params[:id]).destroy 
    @song = Song.all
    redirect_to songs_url
    end


    private 

    def strong_params(*args)
    params.require(:song).permit(*args)
    end

end
