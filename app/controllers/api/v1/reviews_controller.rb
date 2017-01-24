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

  def update_votes
  #   vote_data = JSON.parse(request.body.read)
  #   @review = Review.find(params[:review_id])
  #   @user = @review.user
  #   @existing_vote = Vote.find_by(user: @user, review: @review)
  #   if !@existing_vote.nil?
  #     @existing_vote.update(value: vote_data["vote"]["value"])
  #   else
  #     @vote = Vote.new(review: @review, user: @user, value: vote_data["vote"]["value"])
  #     if @vote.save
  #       @total_votes = @review.total_votes
  #       render json: @total_votes
  #     else
  #       render json: { message: "Did not work" }, status: 404
  #     end
  #   end
  # end
  end
end
