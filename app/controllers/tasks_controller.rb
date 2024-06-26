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
    if @task.save
      member_ids = params[:task][:members]
      if params[:task][:reccurence] == "0"
        ids = member_ids.map { |member| member[:user_id] }
        ids.each do |id|
          user = User.find(id)
          user.task_managers << TaskManager.create(task: @task, user: user)
        end
      else
        @task.save
      end
      redirect_to root_path
    end
  end

  def edit
  end

  def update
    was_achieved = @task.achieved
    @task.update(task_params)
    @team = current_user.team
    @reward = @team.rewards.find { |reward| reward.selected == true }

    if @task.achieved == true && was_achieved == false
      @team.update(score: @team.score += @task.points)
      if @team.score >= @reward.goal
        redirect_to user_path(current_user)
        flash[:notice] = "Bravo ! #{@team.name} a remporté : #{@reward.name}"
      else
        redirect_to user_path(current_user)
      end
    else
      redirect_to user_path(current_user)
    end
    # redirect_back fallback_location: root_path, notice: "Task updated"
  end

  def destroy
    @task.destroy
    redirect_to user_path(current_user)
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :category, :reccurence, :points, :deadline, :achieved, :priority)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end
