class PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.all
  end

  def show
    @podcast = Podcast.find(params[:id])
    binding.pry
    if @edit_review.nil?
      @new_review = Review.new
    end
    if !@podcast.reviews.empty?
      @reviews = @podcast.reviews.order("updated_at DESC").all
      if !@edit_review.nil?
        @edit_review = @podcast.reviews.find(params[:review_id])
      end
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
      if host_info[:name] != ""
        host = Host.find_or_create_by(name: host_info[:name])
        if !host.id.nil?
          @hosts.push(host)
        end
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

  def edit
    @podcast = Podcast.find(params[:id])
    @categories = Category.order(name: :asc)
  end

  def update
    @podcast = Podcast.find(params[:id])
    @hosts = []
    podcast_params[:hosts_attributes].each do |_key, host_info|
      if host_info[:name] != ""
        host = Host.find_or_create_by(name: host_info[:name])
        if !host.id.nil?
          @hosts.push(host)
        end
      end
    end

    @podcast.hosts = @hosts

    @podcast.categories = Category.where(id: params[:podcast][:category_ids])

    podcast_edited_params = podcast_params
    podcast_edited_params[:hosts_attributes] = {}

    if @podcast.update(podcast_edited_params)
      flash[:notice] = "Podcast updated successfully."
      redirect_to @podcast
    else
      flash.now[:notice] = @podcast.errors.full_messages
      @categories = Category.order(name: :asc)
      render :edit
    end
  end

  def destroy
    @podcast = Podcast.find(params[:id])
    @podcast.destroy
    flash[:notice] = "Podcast was successfully deleted."
    redirect_to podcasts_path
  end

  private

  def podcast_params
    params.require(:podcast).permit(:name, :description, :host, :provider_name,
      :average_length, :release_year, :itunes_url, :soundcloud_url,
      hosts_attributes: [:name])
  end
end
