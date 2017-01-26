class ReviewMailer < ApplicationMailer
  def new_review_email(review)
    @new_review = review

    mail(
      to: review.podcast.user.email,
      subject: "New review for #{review.podcast.name}"
    )
  end
end
