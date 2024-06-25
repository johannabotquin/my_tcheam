class TeamsController < ApplicationController

  def show
    @team = current_user.team
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

  def run_wheel
    @team = current_user.team
    @recurrent_tasks = @team.tasks.where(reccurence: true)
    @available_users = @team.users
    @recurrent_tasks_counter = @recurrent_tasks.count
    @team_members_counter = 2

    ## Dispatcher les taches en fonctions du nombre d'user et de taches
    # si c'est pair, je distribue les taches de manière équitable

    # si c'est impair, je distribue les taches de manière équitable et j'en laisse une de côté que j'attribue aléatoirement à un user

    @user_sampled = @team.users.shuffle.pluck(:id)

    @recurrent_tasks.each do |task|
      if @user_sampled.empty?
        @user_sampled = @team.users.shuffle.pluck(:id) # Assurez-vous de recharger les IDs si nécessaire
      end
      user_id = @user_sampled.shift # Cela retire et retourne le premier élément de @user_sampled
      TaskManager.create(task: task, user_id: user_id)
    end

  end

  def brouillon
    if @recurrent_tasks_counter % @team_members_counter == 0
      @available_users.each do |user|
        @recurrent_tasks.each do |task|
          user.task_managers << TaskManager.create(task: task, user: user)
        end
      end
    end
  end

  private

  def team_params
    params.require(:team).permit(:name, :photo)
  end
end
