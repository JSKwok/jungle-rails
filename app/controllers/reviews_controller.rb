class ReviewsController < ApplicationController

  def create

    @product = Product.find(params[:product_id])
    puts current_user
    @review = Review.new(review_params)
    puts 'Here we are', @review.attributes
    @review.save
    puts 'After the save'
    if @review.save
      redirect_to product_path(@product)
    else
      redirect_to product_path(@product)
      puts "Shit failed you asshole."
    end

  end

  private

  def review_params
    params.require(:review).permit(:rating, :description)
  end


# find the parent model
# Use the has_many association to initialize the child instance
# Attempt to save
# If successful: redirect to appropriate page
# Else: render the page where the form resides

end
