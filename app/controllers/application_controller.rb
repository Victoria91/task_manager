class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: :sign_in
  before_action :authorize_user!
  before_action :load_task, except: [:new, :index, :create]

  def sign_in
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      redirect_to [:admin, :tasks]
    else
      render 'new'
    end
  end

  def edit
    render 'new'
  end

  def destroy
    @task.destroy
    redirect_to [:admin, :tasks]
  end

  def update
    if @task.update(task_params)
      redirect_to [:admin, :tasks]
    else
      render 'new'
    end
  end

  private

  def authenticate_user!
    # redirect_to :sign_in unless session[:user_id]
  end


  def authorize_user!
  end

  def load_task
    @task = Task.find(params[:id])
  end
end
