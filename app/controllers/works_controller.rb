class WorksController < ApplicationController

  def root
    # homepage
  end

  def index
    # view all works
    @works = Work.all
  end

  def new
    @work = Work.new
  end

  def create
    # POST new work
  end

  def show
    # individual work
  end

  def edit
    # GET changes
  end

  def update
    # POST changes
  end

  def destroy
    # DELETE
  end

  def upvote
    # vote on works
  end

  private
  def work_params
    params.require(:work).permit(:title, :category, :creator, :description, :publication_year)
  end
end
