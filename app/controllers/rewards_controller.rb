class RewardsController < ApplicationController
  # def index
  #   # @team = Team.find(params[:team_id])
  #   # @rewards = @team.rewards

  # end

  before_action :set_team

  def index
    @rewards = @team.rewards
    @selected_reward = @team.rewards.find_by(selected: true)
  end

  def select
    @reward = @team.rewards.find(params[:id])
    @team.rewards.update_all(selected: false)
    @reward.update(selected: true)
    respond_to do |format|
      format.html { redirect_to user_path(current_user), notice: 'La récompense a été choisie.' }
      format.json { render json: { success: true, reward_id: @reward.id } }
    end
  end

  def new
    @team = Team.find(params[:team_id])
    @reward = Reward.new
  end

  def create
    @team = Team.find(params[:team_id])
    @reward = Reward.new(reward_params)
    @reward.team_id = current_user.team_id
    @reward.user_id = current_user.id

    if @reward.save
      redirect_to team_rewards_path(@team), notice: 'La recompense est créée.'
    else
      render :new
    end
  end

  def edit
    @team = Team.find(params[:team_id])
    @reward = @team.rewards.find(params[:id])
  end

  def update
    @team = Team.find(params[:team_id])
    @reward = @team.rewards.find(params[:id])
    if @reward.update(reward_params)
      redirect_to team_rewards_path(@team, @reward), notice: 'La recompense est mise à jour.'
    else
      render :edit
    end
  end

  def destroy
    @team = Team.find(params[:team_id])
    @reward = @team.rewards.find(params[:id])
    @reward.destroy
    redirect_to team_rewards_path(@team), status: :see_other
  end

  private

  def reward_params
    params.require(:reward).permit(:name, :goal)
  end

  def set_team
    @team = Team.find(params[:team_id])
  end
end
