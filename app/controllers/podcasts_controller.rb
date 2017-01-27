class PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.all
    if params[:search]
      @podcasts = Podcast.search(params[:search]).order("created_at DESC")
    else
      @podcasts = []
    end
  end

  def show
    @podcast = Podcast.find(params[:id])
    @host_names = []
    if !@podcast.hosts.empty?
      @podcast.hosts.each do |host|
        @host_names << host.name
      end
    end
    @category_names = []
    if !@podcast.categories.empty?
      @podcast.categories.each do |category|
        @category_names << category.name
      end
    end
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
    @user = current_user
    if user_signed_in?
      podcast_params[:hosts_attributes].each do |_key, host_info|
        if host_info[:name] != ""
          host = Host.find_or_create_by(name: host_info[:name])
          if !host.id.nil?
            @hosts.push(host)
          end
        end
      end
      @podcast.user = @user
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
    else
      flash.now[:notice] = "User must be signed in!"
      @categories = Category.order(name: :asc)
      render :new
    end
  end

  def edit
    @podcast = Podcast.find(params[:id])
    @categories = Category.order(name: :asc)
    if current_user != @podcast.user && !admin_signed_in?
      flash.now[:notice] = "Only authorized user can edit podcast!"
      render :index
    end
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
    if current_user == @podcast.user || admin_signed_in?
      @podcast.destroy
      flash[:notice] = "Podcast was successfully deleted."
      redirect_to podcasts_path
    else
      flash.now[:notice] = "You must be authorized user to delete podcast!"
    end
  end

  private

  def podcast_params
    params.require(:podcast).permit(:name, :description, :host, :provider_name,
      :average_length, :release_year, :image_url, :itunes_url, :soundcloud_url,
      hosts_attributes: [:name])
  end
end
