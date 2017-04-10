class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: :sign_in
  before_action :authorize_user!
  before_action :load_task, except: [:new, :index, :create]
  # layout 'Webpage'


  def sign_in
    
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
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
