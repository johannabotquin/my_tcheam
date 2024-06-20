class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
    @user = current_user
    @team = @user.team
    @tasks = @user.tasks
    @reward = @team.rewards.find { |reward| reward.selected == true }
    @team.score = @team.users.sum do |user|
      user.tasks.where(achieved: true).sum(:points)
    end
    @remaining_points = @reward.goal - @team.score
    @tasks_completed = @team.users.joins(:tasks).where(tasks: { achieved: true }).count
    @tasks_remaining = @team.users.joins(:tasks).where(tasks: { achieved: false }).count
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
