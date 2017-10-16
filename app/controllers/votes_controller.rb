class VotesController < ApplicationController
  def create
    @vote = Vote.new(user_id:session[:user_id], work_id:params[:id])
    @vote.save
    redirect_to work_path(params[:id])
  end
end
