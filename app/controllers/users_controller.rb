class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
    @user = current_user
    @team = @user.team
    @tasks = @user.tasks
    @reward = @team.rewards.select { |reward| reward.selected == true }
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
