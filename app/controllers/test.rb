before_action :set_team
before_action :set_reward, only: [:show, :edit, :update, :destroy]




def set_team
  @team = Team.find(params[:team_id])
end

def set_reward
  @reward = @team.rewards.find(params[:id])
end
