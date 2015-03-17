class GoalsController < ApplicationController


  def new
    @goal = Goal.new
  end

  def create
    @goal = current_user.goals.new(goal_params)
    if @goal.save
      redirect_to goal_url(@goal)
    else
      flash[:error] = @goal.errors.full_messages
      redirect_to new_goal_url
    end
  end

  def show
    @goal = Goal.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to goal_url(@goal)
    else
      flash[:error] = @goal.errors.full_messages
      redirect_to edit_goal_url(@goal)
    end
  end

  def destroy
    @goal = Goal.find(params[:id])
    user = @goal.user
    @goal.destroy
    redirect_to user_url(user)
  end


  private

  def goal_params
    params.require(:goal).permit(:description, :status, :shared_status)
  end
end
