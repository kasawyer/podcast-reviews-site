class ReviewsController < ApplicationController
  def create
    @podcast = Podcast.find(params[:podcast_id])
    @new_review = Review.new(review_params)
    @new_review.podcast = @podcast
    @new_review.podcast.user = @podcast.user
    @new_review.user = current_user
    if user_signed_in?
      if @new_review.save
        ReviewMailer.new_review_email(@new_review).deliver_later
        flash.now[:notice] = "Review added successfully"
        redirect_to podcast_path(@podcast)
      else
        flash.now[:notice] = @new_review.errors.full_messages.to_sentence
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
