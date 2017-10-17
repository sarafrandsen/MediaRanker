class WorksController < ApplicationController

  def main
    user_id = session[:user_id]
    if user_id
      @user = User.find(user_id)
    end
  end

  def index
    # view all works
    @movies = Work.where(category: 'movie')
    @books = Work.where(category: 'book')
    @albums = Work.where(category: 'album')
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
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to works_path
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
