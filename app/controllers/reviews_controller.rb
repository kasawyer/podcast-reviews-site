class ReviewsController < ApplicationController
  def show
    @review = Review.find(params[:id])
  end

  def new
    @podcast = Podcast.find(params[:podcast_id])
    @review = Review.new
    @review.user = current_user
  end

  def create
    @podcast = Podcast.find(params[:podcast_id])
    @review = Review.new(review_params)
    @review.podcast = @podcast
    @review.user = current_user

    if @review.save
      flash[:notice] = "Review added successfully"
      redirect_to podcast_path(@podcast)
    else
      flash.now[:notice] = @review.errors.full_messages.to_sentence
      render :'/podcasts/show'
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body, :user_id, :podcast_id,
      :timestamp)
  end
end
