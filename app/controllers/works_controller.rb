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
    @work = Work.new(work_params)
    if @work.save
      redirect_to work_path(@work.id)
    else
      render new_work_path
    end
    # POST new work
  end

  def show
    @work = Work.find(params[:id])
    # individual work
  end

  def edit
    @work = Work.find(params[:id])
    # GET changes
  end

  def update
    @work = Work.find(params[:id])
    if @work.update(work_params)
      return redirect_to works_path
    else
      return render :edit, status: :bad_request
    end
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
