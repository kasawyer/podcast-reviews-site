class PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.all
  end

  def show
    @podcast = Podcast.find(params[:id])
    @review = Review.new
    if @review
      @review = Review.find(params[:podcast_id])
      @reviews = @podcast.reviews
    end
  end

  def new
    @podcast = Podcast.new
    @categories = Category.order(name: :asc)
    @podcast.provider_name = ""
  end

  def create
    @podcast = Podcast.new(podcast_params)
    @hosts = []
    podcast_params[:hosts_attributes].each do |_key, host_info|
      host = Host.find_or_create_by(name: host_info[:name])
      if !host.id.nil?
        @hosts.push(host)
      end
    end

    @podcast.hosts = @hosts
    @podcast.categories = Category.where(id: params[:podcast][:category_ids])

    if @podcast.save
      flash[:notice] = "Podcast added successfully"
      redirect_to podcast_path(@podcast)
    else
      flash.now[:notice] = @podcast.errors.full_messages.to_sentence
      @categories = Category.order(name: :asc)
      render :new
    end
  end

  private

  def podcast_params
    params.require(:podcast).permit(:name, :description, :host, :provider_name,
      :average_length, :release_year, :itunes_link, :soundcloud_link,
      hosts_attributes: [:name])
  end
end
