class GoalsController < ApplicationController
  include SessionsHelper

  def index
    @goals = current_user.goals
  end

  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = current_user.id

    @goal.save

    if @goal.save
      flash[:success] = "Goal created!"
      redirect_to goals_url
    else
      render 'new'
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

    private
  
    def goal_params
      params.require(:goal).permit(:description, :type, :goal, :achieved)
    end
end
