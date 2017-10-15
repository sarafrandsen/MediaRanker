class WorksController < ApplicationController
  def index
    @albums = Work.where(category: "album")
    @movies = Work.where(category: "book")
    @books = Work.where(category: "movie")
  end

  def new
    @work = Work.new
  end

  def create
    flash[:status] = :success
    flash[:message] = "Successfully added #{@work.title}."
    return redirect_to work_path(@work.id)
  else
    flash.now[:status] = :failure
    flash.now[:message] = "Failed to add a new #{@work.category}."
    flash.now[:details] = @work.errors.messages
    return render :new, status: :bad_request
  end
end

  def show
    @work = Work.find(params[:id])
  end

  def edit
    @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    @work.update(work_params)
    @work.save

    redirect_to work_path(@work)
  end

  def destroy
    @work = Work.find(params[:id])
    @work.destroy

    redirect_to works_path
  end

  private

  def work_params
    params.require(:work).permit(:title, :creator, :year_released, :description)
  end
end
