class TasksController < ApplicationController
  before_action :set_task, only: %i[show edit update destroy]

  def index

    @my_tasks_ids = current_user.task_managers.map { |tm| tm.task_id }
    @tasks = Task.where(id: @my_tasks_ids)


    if params[:filter] && params[:filter][:date].present?
      selected_date = Date.parse(params[:filter][:date])
      @tasks = @tasks.where(deadline: selected_date)
    end

    respond_to do |format|
      format.html do
        if request.xhr?
          render partial: "tasks/tasks_list", locals: { tasks: @tasks }, layout: false
        end
      end
      format.text do
        if request.xhr?
          render partial: "tasks/tasks_list", locals: { tasks: @tasks }, layout: false
        end
      end
    end
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
    # manager_ids = params[:task][:manager_ids].reject(&:empty?)
    # user.task_managers << TaskManager.create(task: @task, user_id: user.id)
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
