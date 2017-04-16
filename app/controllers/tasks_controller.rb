class TasksController < ApplicationController
  # before_action :authenticate_user!, except: [:sign_in, :log_in]
  before_action :authorize_user!
  before_action :load_task, except: [:index, :new, :create]

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to user_path
    else
      render 'new'
    end
  end

  def edit
    render 'new'
  end

  def destroy
    @task.destroy
    redirect_to user_path
  end

  def update
    if @task.update(task_params)
      redirect_to user_path
    else
      render 'new'
    end
  end

  private
  def load_task
    @task = Task.find(params[:id])
  end
end