class MasterMenusController < ApplicationController

  before_action :authenticate_customer!, {only: [:new, :edit]}

  def index
    @master_menus = MasterMenu.all
    @master_menus = MasterMenu.page(params[:page]).per(6)
  end

  def new
    @master_menu = MasterMenu.new
    @master_menu_recipe = @master_menu.master_menu_recipes.build
  end

  def create
    @master_menu= MasterMenu.new(master_menu_params)

    if @master_menu.save
      redirect_to master_menus_path
    else
      @master_menus = MasterMenu.all
      render "new"
    end
  end

  def show
    @master_menu=MasterMenu.find(params[:id])
    @master_menu_recipes=MasterMenuRecipe.where(master_menu_id: @master_menu.id)
  end

  def edit
    @master_menu= MasterMenu.find(params[:id])
  end

  def update
    @master_menu= MasterMenu.find(params[:id])
    if @master_menu.update(master_menu_params)
      redirect_to master_menu_path(@master_menu.id)
    else
      @master_menu= MasterMenu.find(params[:id])
      render "edit"
    end
  end

  def destroy
    @master_menu= MasterMenu.find(params[:id])
    if @master_menu.destroy
      redirect_to admins_master_menus_path
    end
  end


  private
    def master_menu_params
      params.require(:master_menu).permit(:name, :is_master, :customer_id, :menu_genre_id, :image, :count, master_menu_recipes_attributes: [:id, :master_dish_id, :amount, :_destroy])
    end
end
