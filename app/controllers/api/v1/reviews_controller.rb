class Api::V1::ReviewsController < ApplicationController
  respond_to :json

  def index
    @podcast = Podcast.find(params[:podcast_id])
    @reviews = @podcast.reviews.sort_by { |review| review.total_votes }.reverse
    render json: @reviews
  end

  def total_votes
    @review = Review.find(params[:review_id])
    render json: @review.total_votes
  end

  def update
    review_data = JSON.parse(request.body.read)
    @review = Review.find(params[:id])
    if @review.update(
      rating: review_data["review"]["rating"],
      body: review_data["review"]["body"]
    )
      render json: {
        review: @review,
        message: "Review updated successfully",
        editing: false
      }
    else
      render json: {
        review: @review,
        message: @review.errors.full_messages.to_sentence,
        editing: true
      }
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.votes.each do |vote|
      vote.destroy
    end
    if @review.destroy
      @podcast = Podcast.find(params[:podcast_id])
      @reviews = @podcast.reviews
      render json: { reviews: @reviews, message: "Review deleted" }
    end
  end
end
