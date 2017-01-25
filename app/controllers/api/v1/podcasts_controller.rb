class Api::V1::PodcastsController < ApplicationController
  respond_to :json

  def index
    @podcasts = Podcast.all
    render json: @podcasts
  end
end
