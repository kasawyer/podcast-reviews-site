class ReviewsController < ApplicationController
  def create
    @podcast = Podcast.find(params[:podcast_id])
    @new_review = Review.new(review_params)
    @new_review.podcast = @podcast
    @new_review.user = current_user
    if user_signed_in?
      if @new_review.save
        flash[:notice] = "Review added successfully"
        redirect_to podcast_path(@podcast)
      else
        flash.now[:notice] = @new_review.errors.full_messages.to_sentence
        render :'/podcasts/show'
      end
    else flash[:notice] = "User must be signed in!"
    end
  end

  def edit
    @podcast = Podcast.find(params[:podcast_id])
    @edit_review = Review.find(params[:id])
    @new_review = @edit_review
    @reviews = @podcast.reviews
    if current_user == @edit_review.user || admin_signed_in?
      render :'podcasts/show'
      flash[:notice] = "Editing review..."
    else
      new_id = params[:podcast_id]
      redirect_to "/podcasts/#{new_id}"
      flash[:notice] = "Only authorized user can edit review!"
    end
    @host_names = []
    if !@podcast.hosts.empty?
      @podcast.hosts.each do |host|
        @host_names << host.name
      end
    end
  end

  def update
    @edit_review = Review.find(params[:id])
    @podcast = Podcast.find(params[:podcast_id])
    if @edit_review.update(review_params)
      flash[:notice] = "Review updated successfully"
      @new_review = Review.new(review_params)
      @new_review.podcast = @podcast
      @new_review.user = current_user
      redirect_to podcast_path(@podcast)
    else
      flash.now[:notice] = @edit_review.errors.full_messages.to_sentence
      @podcast = Podcast.find(params[:podcast_id])
      @reviews = @podcast.reviews.order("updated_at DESC").all
      @edit_review = @podcast.reviews.find(params[:id])
      @host_names = []
      if !@podcast.hosts.empty?
        @podcast.hosts.each do |host|
          @host_names << host.name
        end
      end
      render :'/podcasts/show'
    end
  end

  def destroy
    @podcast = Podcast.find(params[:podcast_id])
    @review = @podcast.reviews.find(params[:id])
    @review.destroy
    @new_review = Review.new
    @reviews = @podcast.reviews
    flash.now[:notice] = "Review deleted"
    render :'/podcasts/show'
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body, :user_id, :podcast_id,
      :timestamp)
  end
end
