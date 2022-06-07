class ApplicationController < ActionController::Base
  before_action :set_current_user

  # ログインユーザー
  def set_current_user
    @current_user = User.find_by(id: session[:user_id])
  end

  # ログイン状態時のページ制限
  def forbid_login_user
    if @current_user
      flash[:alert] = 'すでにログインしています'
      redirect_to('/')
    end
  end

end
