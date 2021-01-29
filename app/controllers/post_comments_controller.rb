class PostCommentsController < ApplicationController

  before_action :authenticate_customer!

  def create
    master_dish = MasterDish.find(params[:master_dish_id])
    comment = current_customer.post_comments.new(post_comment_params)
    comment.customer_id = current_customer.id
    comment.master_dish_id = master_dish.id
    comment.save
    redirect_to master_dish_path(master_dish)
  end

  def destroy
    PostComment.find_by(id: params[:id], master_dish_id: params[:master_dish_id]).destroy
    redirect_to master_dish_path(params[:master_dish_id])
  end

  private
  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
