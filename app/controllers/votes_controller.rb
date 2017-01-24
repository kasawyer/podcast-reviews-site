class VotesController < ApplicationController
  def index
    @votes = review.votes
  end

  def create

  end

  def update
    binding.pry
  end
end
