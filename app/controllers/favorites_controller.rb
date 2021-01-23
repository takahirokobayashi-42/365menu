class FavoritesController < ApplicationController
  def create
    master_dish = MasterDish.find(params[:master_dish_id])
    favorite = current_customer.favorites.new(master_dish_id: master_dish.id)
    favorite.save
    redirect_to master_dish_path(master_dish)
  end

  def destroy
    master_dish = MasterDish.find(params[:master_dish_id])
    favorite = current_customer.favorites.find_by(master_dish_id: master_dish.id)
    favorite.destroy
    redirect_to master_dish_path(master_dish)
  end
end
