class Admins::FoodstuffsController < ApplicationController
  
  before_action :authenticate_admin!
  
  def index
    @foodstuff= Foodstuff.new
    @foodstuffs = Foodstuff.all
  end

  def create
    @foodstuff= Foodstuff.new(foodstuff_params)
    if @foodstuff.save
      redirect_to admins_foodstuffs_path
    else
      @foodstuffs = Foodstuff.all
      render :index
    end
  end

  def show
    @foodstuff=Foodstuff.find(params[:id])
  end

  def edit
    @foodstuff= Foodstuff.find(params[:id])
  end

  def update
    @foodstuff= Foodstuff.find(params[:id])
    if @foodstuff.update(foodstuff_params)
      redirect_to admins_foodstuff_path(@foodstuff.id)
    else
      render :edit
    end
  end

  def destroy
    @foodstuff= Foodstuff.find(params[:id])
    if @foodstuff.destroy
      redirect_to admins_foodstuffs_path
    end
  end


  private
    def foodstuff_params
      params.require(:foodstuff).permit(:name, :category_id, :calory, :protein, :carbohydrate, :fat)
    end
end