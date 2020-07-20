# application controller
class ApplicationController < ActionController::Base
  helper_method :current_user, :logged_in?
  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] # or=
  end

  def logged_in?
    !!current_user
  end

  def require_user
    return if logged_in?

    flash[:alert] = 'You must be logged in to perform that action'
    redirect_to login_path
  end

  def require_same_user
    return if current_user == @article.user

    flash[:alert] = 'Cannot edit articles belonging to other bloggers'
    redirect_to @article
  end
end
