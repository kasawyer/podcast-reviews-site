class PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.all
  end

  def show
    @podcast = Podcast.find(params[:id])
  end

  def new
    @podcast = Podcast.new
  end

  def create
    @podcast = Podcast.new(podcast_params)

    if @podcast.save
      flash[:notice] = "Podcast added successfully"
      redirect_to podcast_path(@podcast)
    else
      flash.now[:notice] = @podcast.errors.full_messages
      render :new
    end
  end

  private

  def podcast_params
    params.require(:podcast).permit(:name, :provider, :description, :category, :host, :average_length, :release_year, :itunes_link, :soundcloud_link)
  end
end
