class MangasController < ApplicationController
    def index
        @mangas = Manga.all
    end

    def show
        @manga = Manga.find(params[:id])
    end 

    def new
        @manga = Manga.new()
    end

    def create
        @manga = Manga.new(manga_params)
        if @manga.save
            flash[:notice] = "New manga was created successfully"
            redirect_to mangas_path
        else
            render 'new'
        end
    end

    def edit
        @manga = Manga.find(params[:id])
    end

    def update
        @manga = Manga.find(params[:id])
        if @manga.update(manga_params)
            flash[:notice] = "Your manga was updated successfully"
            redirect_to mangas_path
        else
            render 'edit'
        end
    end

    def destroy
        @manga = Manga.find(params[:id])
        @manga.destroy
        flash[:notice] = "Manga was deleted successfully"
        redirect_to mangas_path
    end

    private
    def manga_params
        params.require(:manga).permit(:title, :mangaka, :collected, :status)
    end
end