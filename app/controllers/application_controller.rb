class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!, except: [:sign_in, :log_in]

  helper_method :current_user

  def log_in
    if current_user
      session[:user_id] = current_user.id
      redirect_to user_path
    else
      flash[:alert] = 'Неправильный логин или пароль!'
      render :sign_in
    end
  end

  def sign_out
    reset_session
    redirect_to :sign_in, flash: { notice: 'пока-пока!' }
  end

  def coverage
    render File.join(Rails.root, 'coverage', 'index.html')
  end

  private

  def render_anauthorized
    render text: 'Доступ запрещён', status: 403
  end

  def current_user
    @current_user ||= User.find_by(user_params)
  end

  def user_params
    return authenticate_params unless session[:user_id]
    { id: session[:user_id] }
  end

  def user_path
    [ current_user.admin? ? :admin : :user, :tasks]
  end

  def authenticate_params
    params[:log_in]&.permit(:email, :password)
  end

  def authenticate_user!
    redirect_to :sign_in unless session[:user_id]
  end
end
