class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
    @user = current_user
    @team = @user.team
    @tasks = @user.tasks
    @lists = @user.lists
    @reward = @team.rewards.find { |reward| reward.selected == true }
    @tasks_completed = 0
    @tasks_remaining = current_user.tasks.where(achieved: false).count

    if !@reward.nil? && @team.score >= @reward.goal
      @team.update(score: 0)
      @reward.update(selected: false)
    # @team.score = @team.users.sum do |user|
    #   user.tasks.where(achieved: true).sum(:points)
    # end
    elsif !@reward.nil?
      @remaining_points = @reward.goal - @team.score
      # @tasks_completed = @team.users.joins(:tasks).where(tasks: { achieved: true }).count
      @tasks_completed = current_user.tasks.where(achieved: true).count
      # @tasks_remaining = @team.users.joins(:tasks).where(tasks: { achieved: false }).count
      @tasks_remaining = current_user.tasks.where(achieved: false).count
    # else
    #   @team.score = 0
    #   @remaining_points = 0
    #   @tasks_completed = 0
    #   @tasks_remaining = 0
    end
  end

  private

  def set_user
    @user = current_user
  end
end
