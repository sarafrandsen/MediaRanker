class VotesController < ApplicationController
  def index
    @vote = Vote.all
  end

  def new
    @vote = Vote.new 
end
