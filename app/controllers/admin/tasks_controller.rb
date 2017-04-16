class Admin::TasksController < TasksController
  def index
    @tasks = Task.all
  end

  private

  def authorize_user!
    render text: 'Доступ запрещён', status: 403  unless current_user.admin?
  end

  def task_params
    params.require(:task).permit(:description, :name, :user_id)
  end
end