class TasksController < ApplicationController

  before_action :set_task, only: %i[show edit update destroy]

  def index
    @tasks = Task.all
  end

  def show
  end

  def new
    @task = Task.new
    @task.user = current_user
    @members = @task.user.team.users
  end

  def create
    @task = Task.new(task_params)
    @task.user = current_user
    if @task.save
      redirect_to task_path(@task)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  def destroy
    @task.destroy
    redirect_to user_path(current_user)
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :category, :reccurence, :points, :deadline, :achieved, :priority_tag)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
