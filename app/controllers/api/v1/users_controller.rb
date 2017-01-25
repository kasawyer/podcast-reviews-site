class Api::V1::UsersController < ApplicationController
  respond_to :json

  def index
    @review = Review.find(params[:review_id])
    @user = @review.user
    render json: @user
  end
end
