class Api::V1::ReviewsController < ApplicationController
  respond_to :json

  def index
    @podcast = Podcast.find(params[:podcast_id])
    @reviews = @podcast.reviews
    render json: @reviews
  end
end
