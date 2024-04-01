class MangasController < ApplicationController
    def index
        @mangas = Manga.all
    end

    def show
        @manga = Manga.find(params[:id])
    end 

    def new
        @manga = Manga.new
    end

    def create
        @manga = Manga.new(params.require(:manga).permit(:title, :mangaka, :collected, :status))
        if @manga.save
            flash[:notice] = "New manga was created successfully"
            redirect_to @manga
        else
            render 'new'
        end
    end

    def destroy
        @manga = Manga.find(params[:id])
        @manga.destroy
        flash[:notice] = "Manga was deleted successfully"
        redirect_to mangas_path
    end
end