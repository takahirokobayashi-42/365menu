class Admins::MasterDishesController < ApplicationController
  def index
    @master_dishes = MasterDish.all
  end

  def new
    @master_dish= MasterDish.new
    @foodstuff = @master_dish.foodstuffs.build
  end

  def create
    @master_dish= MasterDish.new(master_dish_params)
    if @master_dish.save
      redirect_to admins_master_dishes_path
    else
      @master_dishes = MasterDish.all
      render :index
    end
  end

  def show
    @master_dish=Masterdish.find(params[:id])
  end

  def edit
    @master_dish= Masterdish.find(params[:id])
  end

  def update
    @master_dish= Masterdish.find(params[:id])
    if @master_dish.update(master_dish_params)
      redirect_to admins_master_dish_path(@master_dish.id)
    else
      render :edit
    end
  end

  def destroy
    @master_dish= Masterdish.find(params[:id])
    if @master_dish.destroy
      redirect_to admins_master_dishes_path
    end
  end


  private
    def master_dish_params
      params.require(:master_dish).permit(:name, :genre_id, :foodstuff_id, :image_id, :recipe, :amount, :total_calory, :total_protein, 
        :total_carbohydrate, :total_fat, foodstuffs_attributes: [:id, :category_id, :name, :image_id, :calory, :protein, :carbohydrate, :fat])
    end
end
