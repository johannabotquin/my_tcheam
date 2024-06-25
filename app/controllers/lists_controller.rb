class ListsController < ApplicationController

  before_action :set_list, only: %i[show edit update destroy]
  before_action :set_user, only: %i[show]

  def index
    @my_lists_ids = current_user.list_managers.map { |lm| lm.list_id }
    @lists = List.where(id: @my_lists_ids)
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
      member_ids = params[:task][:members]
      ids = member_ids.map { |member| member[:user_id] }
      ids.each do |id|
        user = User.find(id)
        user.list_managers << ListManager.create(list: @list, user: user)
      end
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @list.update(list_params)
    respond_to do |format|
      format.html { redirect_to user_list_path(current_user, @list)}
      format.text { render partial: "lists/list_updated", locals: {list: @list}, formats: [:html] }
    end
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
