class MasterDishesController < ApplicationController

  before_action :authenticate_customer!, {only: [:new, :edit]}

  def index
    @master_dishes = MasterDish.all
    @master_dishes = MasterDish.page(params[:page]).per(6)
    master_dishes = MasterDish.all #データを全て取得
    master_dishes = master_dishes.map(&:name) #:nameを取り出し、戻り値として配列で作成
    respond_to do |format| #respondo_to=指定した形式で返すようにするメソッド
    format.html
    format.json{ render json: master_dishes.to_json }
    end
  end

  def new
    @master_dish = MasterDish.new
    @dish_foodstuff = @master_dish.dish_foodstuffs.build
  end

  def auto_complete
    master_dishes = MasterDish.select(:name).where("name like '%" + params[:term] + "%'").order(:name)
    logger.info '*' * 100
    logger.info '*' * 100
    master_dishes = master_dishes.map(&:name)
    render json: master_dishes.to_json
  end


  def create
    @master_dish = MasterDish.new(master_dish_params)
    # 各栄養素を計算
    # レシピの食材の重量　何人前が　nil または　重量が０g以下　1人前以内の場合breakさせてmodelのvalidationでerrorを表示させる
    @master_dish.dish_foodstuffs.each do |dish_foodstuff|
      if dish_foodstuff.amount != nil && @master_dish.count != nil
        if dish_foodstuff.amount > 0 && @master_dish.count >= 1
          @master_dish.total_protein += (((dish_foodstuff.foodstuff.protein/100)*dish_foodstuff.amount)/@master_dish.count).round
          @master_dish.total_carbohydrate += (((dish_foodstuff.foodstuff.carbohydrate/100)*dish_foodstuff.amount)/@master_dish.count).round
          @master_dish.total_fat += (((dish_foodstuff.foodstuff.fat/100)*dish_foodstuff.amount)/@master_dish.count).round
          @master_dish.total_calory += (((dish_foodstuff.foodstuff.calory/100)*dish_foodstuff.amount)/@master_dish.count).round
        else
         break
        end
      else
        break
      end
    end
    if customer_signed_in?
      @master_dish.customer_id = current_customer.id
      @master_dish.is_master = false
    end
    if @master_dish.save
      if admin_signed_in?
        redirect_to admins_master_dishes_path
      else
        redirect_to master_dishes_path
      end
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
    # 保存されている各栄養素をリセット
    @master_dish.total_calory = 0
    @master_dish.total_carbohydrate = 0
    @master_dish.total_fat = 0
    @master_dish.total_protein = 0
    # 各栄養素を計算
    @master_dish.dish_foodstuffs.each do |dish_foodstuff|
      if dish_foodstuff.amount != nil && @master_dish.count != nil
        if dish_foodstuff.amount > 0 && @master_dish.count >= 1
          @master_dish.total_protein += (((dish_foodstuff.foodstuff.protein/100)*dish_foodstuff.amount)/@master_dish.count).round
          @master_dish.total_carbohydrate += (((dish_foodstuff.foodstuff.carbohydrate/100)*dish_foodstuff.amount)/@master_dish.count).round
          @master_dish.total_fat += (((dish_foodstuff.foodstuff.fat/100)*dish_foodstuff.amount)/@master_dish.count).round
          @master_dish.total_calory += (((dish_foodstuff.foodstuff.calory/100)*dish_foodstuff.amount)/@master_dish.count).round
        else
         break
        end
      else
        break
      end
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
