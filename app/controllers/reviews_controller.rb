class ReviewsController < ApplicationController
  def create
    @podcast = Podcast.find(params[:podcast_id])
    @new_review = Review.new(review_params)
    @new_review.podcast = @podcast
    @new_review.user = current_user
    if user_signed_in?
      if @new_review.save
        flash.now[:notice] = "Review added successfully"
        redirect_to podcast_path(@podcast)
      else
        flash.now[:notice] = @new_review.errors.full_messages.to_sentence
        render :'/podcasts/show'
      end
    else flash[:notice] = "User must be signed in!"
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :body, :user_id, :podcast_id,
      :timestamp)
  end
end
