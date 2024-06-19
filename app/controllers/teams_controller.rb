class TeamsController < ApplicationController

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

  def show
    @team = Team.where(user_id: current_user.id)
  end

  private

  def team_params
    params.require(:team).permit(:name, :score, :photo)
  end
end
