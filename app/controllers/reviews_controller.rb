class ReviewsController < ApplicationController
  def create
    @podcast = Podcast.find(params[:podcast_id])
    @new_review = Review.new(review_params)
    @new_review.podcast = @podcast
    @new_review.user = current_user

    if @new_review.save
      flash[:notice] = "Review added successfully"
      redirect_to podcast_path(@podcast)
    else
      flash.now[:notice] = @new_review.errors.full_messages.to_sentence
      render :'/podcasts/show'
    end
  end

  def edit
    @podcast = Podcast.find(params[:podcast_id])
    @review = Review.find(params[:id])
    @new_review = @review
    @reviews = @podcast.reviews
    render :'/podcasts/show'
  end

  def update
    @review = Review.find(params[:id])
    @new_review = Review.new(review_params)
    @new_review.podcast = @podcast
    @new_review.user = current_user
    @podcast = Podcast.find(params[:podcast_id])
    if @review.update(review_params)
      flash[:notice] = "Review updated successfully"
      redirect_to podcast_path(@podcast)
    else
      flash.now[:notice] = "Review not updated"
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
