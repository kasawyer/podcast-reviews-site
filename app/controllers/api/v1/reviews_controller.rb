class Api::V1::ReviewsController < ApplicationController
  respond_to :json

  def index
    @podcast = Podcast.find(params[:podcast_id])
    @reviews = @podcast.reviews
    render json: @reviews
  end

  def total_votes
    @review = Review.find(params[:review_id])
    render json: @review.total_votes
  end

  def edit

  end

  def update
  end

  def destroy
    @review = Review.find(params[:id])
    @review.votes.each do |vote|
      vote.destroy
    end
    @review.destroy
    @podcast = Podcast.find(params[:podcast_id])
    @reviews = @podcast.reviews
    flash[:notice] = "Review deleted"
    render json: @reviews
  end
end
