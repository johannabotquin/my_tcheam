class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def show
    @user = current_user
    @tasks = @user.tasks
  end

  private

  def set_user
    @user = User.find(params[:id])
  end
end
