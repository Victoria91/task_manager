class User::TasksController < TasksController
  def index
    @tasks = Task.where(user_id: session[:user_id])
  end

  private

  def authorize_user!
    return unless @task
    render_anauthorized unless @task.user == current_user
  end

  def task_params
    params.require(:task).permit(:description, :name)
          .merge(user_id: current_user.id)
  end
end
