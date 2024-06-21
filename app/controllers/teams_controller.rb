class TeamsController < ApplicationController

  def show
    @team = current_user.team
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

  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to @team, notice: 'La team est créée.'
    else
      render :new
    end
  end

  def run_wheel
    @team = current_user.team
    # @recurrent_tasks = @team.tasks.where(reccurence: true)
    # @recurrent_tasks.each do |task|
    #   user = @team.users.sample
    #   TaskManager.create(task:, user:)
    # end
  end

  private

  def team_params
    params.require(:team).permit(:name, :photo)
  end
end
