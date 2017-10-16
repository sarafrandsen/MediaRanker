class WorksController < ApplicationController
  def index
    @albums = Work.where(category: 'album')
    @movies = Work.where(category: 'book')
    @books = Work.where(category: 'movie')
  end

  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      flash[:success] = "Successfully created #{@work.category} #{@work.id}"
      redirect_to work_path(@work.id)
    else
      flash.now[:error] = "A problem occurred: Could not create #{@work.category}"
      render :new
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
      flash[:message] = 'Successfully updated #{@work.category} #{@work.id}'
      return redirect_to works_path
    else
      flash.now[:status] = :failure
      flash.now[:message] = 'A problem occurred: Could not update #{@work.category}'
      flash.now[:details] = @work.errors.messages
      return render :edit, status: :bad_request
    end
  end

  def destroy
    @work = Work.find_by(id: params[:id])

    if @work
      @work.destroy
      flash[:status] = :success
      flash[:message] = 'Deleted #{@work.title}.'
      return redirect_to works_path
    else
      flash[:status] = :failure
      flash[:message] = 'Something went wrong!'
      return redirect_to works_path
    end
  end

  private

  def work_params
    return params.require(:work).permit(:category, :title, :creator, :publication_year, :description)
  end

  def find_work_by_params_id
    @work = Work.find_by(id: params[:id])
    unless @work
      head :not_found
    end
    return @work
  end
end
