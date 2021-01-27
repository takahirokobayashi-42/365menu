class Admins::MasterDishesController < ApplicationController
  def index
    @master_dishes = MasterDish.all
    @master_dishes = MasterDish.page(params[:page]).per(6)
  end

  def new
    @master_dish = MasterDish.new
    @dish_foodstuff = @master_dish.dish_foodstuffs.build
    foodstuffs = Foodstuff.all #データを全て取得
    foodstuffs = foodstuffs.map(&:name) #:nameを取り出し、戻り値として配列で作成
    respond_to do |format| #respondo_to=指定した形式で返すようにするメソッド
    format.html
    format.json{ render json: foodstuffs.to_json }
    end
  end

  def auto_complete
    foodstuffs = Foodstuff.select(:name).where("name like '%" + params[:term] + "%'").order(:name)
    logger.info '*' * 100
    logger.info '*' * 100
    foodstuffs = foodstuffs.map(&:name)
    render json: foodstuffs.to_json
  end

  def create
    @master_dish = MasterDish.new(master_dish_params)
    @master_dish.dish_foodstuffs.each do |dish_foodstuff|
      @master_dish.total_protein += ((dish_foodstuff.foodstuff.protein*(dish_foodstuff.amount/100))/@master_dish.count).round
      @master_dish.total_carbohydrate += ((dish_foodstuff.foodstuff.carbohydrate*(dish_foodstuff.amount/100))/@master_dish.count).round
      @master_dish.total_fat += ((dish_foodstuff.foodstuff.fat*(dish_foodstuff.amount/100))/@master_dish.count).round
      @master_dish.total_calory += (dish_foodstuff.foodstuff.calory*(dish_foodstuff.amount/100)/@master_dish.count).round
    end

    if @master_dish.save
      redirect_to master_dishes_path
    else
      @master_dishes = MasterDish.all
      render "new"
    end
  end

  def show
    @master_dish = MasterDish.find(params[:id])
    @post_comment = PostComment.new
    @dish_foodstuffs = DishFoodstuff.all

  end

  def edit
    @master_dish = MasterDish.find(params[:id])
  end

  def update
    @master_dish = MasterDish.find(params[:id])
    @master_dish.dish_foodstuffs.each do |dish_foodstuff|
      @master_dish.total_protein += ((dish_foodstuff.foodstuff.protein*(dish_foodstuff.amount/100))/@master_dish.count).round
      @master_dish.total_carbohydrate += ((dish_foodstuff.foodstuff.carbohydrate*(dish_foodstuff.amount/100))/@master_dish.count).round
      @master_dish.total_fat += ((dish_foodstuff.foodstuff.fat*(dish_foodstuff.amount/100))/@master_dish.count).round
      @master_dish.total_calory += (dish_foodstuff.foodstuff.calory*(dish_foodstuff.amount/100)/@master_dish.count).round
    end
    if @master_dish.update(master_dish_params)
      if admin_signed_in?
        redirect_to admins_master_dish_path(@master_dish.id )
      else
        redirect_to master_dish_path(@master_dish.id)
      end
    else
      @master_dish = MasterDish.find(params[:id])
      render "edit"
    end
  end

  def destroy
    @master_dish = MasterDish.find(params[:id])
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