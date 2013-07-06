class ReviewsController < ApplicationController
  def create
    review = current_user.reviews.build(params[:review])

    if review.save
      render json: review
    else
      render json: review, status: 422
    end
  end
end
