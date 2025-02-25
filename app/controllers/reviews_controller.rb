class ReviewsController < ApplicationController
  before_action :current_user

  def create

    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.user_id = current_user.id
    @review.product_id = @product.id
    @review.save
    if @review.save
      redirect_to product_path(@product)
    else
      redirect_to product_path(@product)
    end

  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = @product.review.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end

end
