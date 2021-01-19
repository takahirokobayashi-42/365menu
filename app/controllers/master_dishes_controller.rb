class MasterDishesController < ApplicationController
  def index
    @master_dishes = MasterDish.all
    @master_dishes=MasterDish.page(params[:page]).per(6)
  end

  def new
    @master_dish= MasterDish.new
    @dish_foodstuff = @master_dish.dish_foodstuffs.build
  end

  def create
    @master_dish= MasterDish.new(master_dish_params)

    if @master_dish.save!
      redirect_to master_dishes_path
    else
      @master_dishes = MasterDish.all
      redirect_to root_path
    end
  end

  def show
    @master_dish=MasterDish.find(params[:id])
    @post_comment=PostComment.new
    @dish_foodstuffs=DishFoodstuff.all
    @total_calory = 0
    @total_fat = 0
    @total_carbohydrate = 0
    @total_protein = 0
  end

  def edit
    @master_dish= MasterDish.find(params[:id])
  end

  def update
    @master_dish= MasterDish.find(params[:id])
    if @master_dish.update(master_dish_params)
      redirect_to master_dish_path(@master_dish.id)
    else
      render :edit
    end
  end

  def destroy
    @master_dish= MasterDish.find(params[:id])
    if @master_dish.destroy
      redirect_to master_dishes_path
    end
  end


  private
    def master_dish_params
      params.require(:master_dish).permit(:name, :genre_id, :image, :recipe, :amount, :total_calory, :total_protein, :count, :is_master, :customer_id,
        :total_carbohydrate, :total_fat, dish_foodstuffs_attributes: [:id, :foodstuff_id, :amount, :_destroy])
    end
end