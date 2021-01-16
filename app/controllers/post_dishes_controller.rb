class PostDishesController < ApplicationController
  def index
    @post_dishes = PostDish.all
  end

  def new
    @post_dish= PostDish.new
    @dish_foodstuff = @post_dish.dish_foodstuffs.build
  end

  def create
    @post_dish= PostDish.new(post_dish_params)

    if @post_dish.save!
      redirect_to dishes_path
    else
      @post_dishes = PostDish.all
      redirect_to root_path
    end
  end

  def show
    @post_dish=PostDish.find(params[:id])
    @dish_foodstuffs=DishFoodstuff.all
    @total_calory = 0
    @total_fat = 0
    @total_carbohydrate = 0
    @total_protein = 0
  end

  def edit
    @post_dish= PostDish.find(params[:id])
  end

  def update
    @post_dish= PostDish.find(params[:id])
    if @post_dish.update(post_dish_params)
      redirect_to admins_post_dish_path(@post_dish.id)
    else
      render :edit
    end
  end

  def destroy
    @post_dish= PostDish.find(params[:id])
    if @post_dish.destroy
      redirect_to admins_post_dishes_path
    end
  end


  private
    def post_dish_params
      params.require(:post_dish).permit(:name, :genre_id, :image, :recipe, :amount, :total_calory, :total_protein, :count,
        :total_carbohydrate, :total_fat, dish_foodstuffs_attributes: [:id, :foodstuff_id, :amount, :_destroy])
    end
end
