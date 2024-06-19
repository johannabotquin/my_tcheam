class ListsController < ApplicationController

  before_action :set_list, only: %i[show edit update destroy]
  before_action :set_user, only: %i[show]

  def index
    @lists = List.where(user: current_user)
  end

  def show
  end

  def new
    @list = List.new
    @list.user = current_user
    @members = @list.user.team.users
  end

  def create
    @list = List.new(list_params)
    @list.user = current_user
    if @list.save
      redirect_to user_list_path(current_user, @list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @list.update(list_params)
    redirect_to user_list_path(current_user, @list)
  end

  def destroy
    @list.destroy
    redirect_to user_lists_path
  end

  private

  def list_params
    params.require(:list).permit(:name, :content)
  end

  def set_list
    @list = List.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end
end
