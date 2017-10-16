class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def show
    @user = User.find_by(id: params[:id])

    unless @user
      return head :not_found
    end
  end

  def create
    user = User.new(name: params[:user][:name])
    user.save
  end
end
