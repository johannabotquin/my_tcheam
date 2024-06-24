class TeamsController < ApplicationController

  def show
    @team = current_user.team
    if @reward.nil?
      @team.update(score: 0)
    else
      @team.score = @team.users.sum do |user|
      user.tasks.where(achieved: true).sum(:points)
      end
    end
    @reward = @team.rewards.find { |reward| reward.selected == true }
    @tasks_by_user = @team.users.each_with_object({}) do |user, hash|
      user_tasks = user.tasks
      if params[:filter] && params[:filter][:date].present?
        selected_date = Date.parse(params[:filter][:date])
        user_tasks = user_tasks.where(deadline: selected_date)
      end
      hash[user.id] = user_tasks
    end

    respond_to do |format|
      format.html
      format.json do
        render json: {
          tasks: @tasks_by_user.map do |user_id, tasks|
            {
              user_id: user_id,
              html: render_to_string(partial: "tasks/tasks_list", locals: { tasks: tasks }, layout: false, formats: [:html])
            }
          end
        }
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

  private

  def team_params
    params.require(:team).permit(:name, :photo)
  end
end
