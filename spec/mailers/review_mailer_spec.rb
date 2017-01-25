require 'spec_helper'

RSpec.describe ReviewMailer, type: :mailer do
  describe 'new_review_email' do
    let!(:user) { FactoryGirl.create(:user, email: 'person1@gmail.com') }
    let!(:american) { FactoryGirl.create(:podcast) }
    let!(:review) { FactoryGirl.create(:review, user: user, podcast: american) }
    let(:mail) { described_class.new_review_email(review).deliver_now }

    it 'renders the subject' do
      expect(mail.subject).to eq("New review for #{review.podcast.name}")
    end

    it 'renders the receiver email' do
      expect(mail.to).to eq(['chewy@gmail.com'])
    end

    it 'renders the sender email' do
      expect(mail.from).to eq(['no-reply@podcastaway.com'])
    end

    it 'assigns @name' do
      expect(mail.body.encoded).to match(review.user.name)
    end
  end
end
