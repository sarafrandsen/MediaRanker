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
    if flash[:status] = :success
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
    if @work.update(work_params)
      flash[:status] = :success
      flash[:message] = "Successfully updated #{@work.title}."
      return redirect_to works_path
    else
      flash.now[:status] = :failure
      flash.now[:message] = "Failed to update #{@work.title}."
      flash.now[:details] = @work.errors.messages
      return render :edit, status: :bad_request
    end
  end

  def destroy
    @work = Work.find_by(id: params[:id])

    if @work
      @work.destroy
      flash[:status] = :success
      flash[:message] = "Deleted #{@work.title}."
      return redirect_to works_path
    else
      flash[:status] = :failure
      flash[:message] = "Something went wrong!"
      return redirect_to works_path
    end
  end

  private

  def work_params
    params.require(:work).permit(:title, :creator, :year_released, :description)
  end
end
