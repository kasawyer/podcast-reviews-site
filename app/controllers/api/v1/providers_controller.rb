class Api::V1::ProvidersController < ApplicationController
  respond_to :json

  def index
    @podcast = Podcast.find(params[:podcast_id])
    @provider = @podcast.provider
    render json: @provider
  end
end
