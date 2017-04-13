module Admin
  class TasksController < ApplicationController
    def index
      @tasks = Task.all
    end

    private

    def task_params
      params.require(:task).permit(:description, :name, :user_id)
    end
  end
end