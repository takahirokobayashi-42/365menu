class SearchesController < ApplicationController
  def search

    @range = params[:range]
    search = params[:search]
    word= params[:word]

    if @range == '1'
      @customer = Customer.search(search,word)
    elsif @range == "2"
      @master_dish = MasterDish.search(search,word)
      @master_dish = @master_dish.page(params[:page])
    else
      @master_menu = MasterMenu.search(search,word)
      @master_menu = @master_menu.page(params[:page])
    end
  end
end