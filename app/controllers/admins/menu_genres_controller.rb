class Admins::MenuGenresController < ApplicationController
  def index
    @menu_genre = MenuGenre.new
    @menu_genres = MenuGenre.all
  end

  def create
    @menu_genre = MenuGenre.new(menu_genre_params)
    if @menu_genre.save
      redirect_to admins_menu_genres_path
    else
      @menu_genres = MenuGenre.all
      render :index
    end
  end

  def edit
    @menu_genre = MenuGenre.find(params[:id])
  end

  def update
    @menu_genre = MenuGenre.find(params[:id])
    if @menu_genre.update(menu_genre_params)
      redirect_to admins_menu_genres_path
    else
      render :edit
    end
  end

  def destroy
    @menu_genre = MenuGenre.find(params[:id])
    if @menu_genre.destroy
      redirect_to admins_menu_genres_path
    end
  end


  private
  def menu_genre_params
    params.require(:menu_genre).permit(:name, :is_active)
  end
end
