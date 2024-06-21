class RewardsController < ApplicationController
  def index
    @team = Team.find(params[:team_id])
    @rewards = @team.rewards
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
end
