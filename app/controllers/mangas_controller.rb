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
        @mangas = Manga.all
        @manga = Manga.new(manga_params)
        if @manga.save
            respond_to do |format|
                format.html {redirect_to mangas_path, notice: "Manga was successfully added"}
                format.turbo_stream
            end
        else
            render 'new', status: :unprocessable_entity
        end
    end

    def edit
        @manga = Manga.find(params[:id])
    end

    def update
        @manga = Manga.find(params[:id])
        if @manga.update(manga_params)
            redirect_to mangas_path, notice: "Manga was successfully updated"
        else
            render 'edit', status: :unprocessable_entity
        end
    end

    def destroy
        @manga = Manga.find(params[:id])
        @manga.destroy
        redirect_to mangas_path, notice: "Manga was successfully deleted"
    end

    private
    def manga_params
        params.require(:manga).permit(:title, :mangaka, :collected, :status)
    end
end