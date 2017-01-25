class Api::V1::VotesController < ApplicationController
  respond_to :json

  def create
    vote_data = JSON.parse(request.body.read)
    @review = Review.find(params[:review_id])
    @user = User.find(vote_data["vote"]["current_user_id"])
    @existing_vote = Vote.find_by(user: @user, review: @review)
    if !@existing_vote.nil?
      @existing_vote.update(value: vote_data["vote"]["value"])
      @total_votes = @review.total_votes
      render json: @total_votes
    else
      @vote = Vote.new(
        review: @review,
        user: @user,
        value: vote_data["vote"]["value"]
      )
      if @vote.save
        @total_votes = @review.total_votes
        render json: @total_votes
      else
        render json: { message: "Did not work" }, status: 404
      end
    end
  end
end
