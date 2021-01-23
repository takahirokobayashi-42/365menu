class SearchesController < ApplicationController
  def search
    @range = params[:range]
    search = params[:search]
    word= params[:word]
    
    if @range == '1'
      @customer = Customer.search(search,word)
    elsif @range == "2"
      @master_dish = MasterDish.search(search,word)
      
    else
      @master_menu = MasterMenu.search(search,word)
    end
  end
end