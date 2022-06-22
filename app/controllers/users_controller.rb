class UsersController < ApplicationController
  before_action :forbid_login_user, { only: [:new, :create, :sign_in, :login] }
  before_action :not_login, { only: [:profile, :account, :edit, :update, :logout] }

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "ユーザー登録が完了しました"
      redirect_to("/")
    else
      render :new, status: :unprocessable_entity
    end
  end

  def login
    @user = User.find_by(email: params[:email])
    @email = params[:email]

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      flash[:notice] = "ログインしました"
      redirect_to("/")
    else
      @error_message = "メールアドレスまたはパスワードが間違っています"
      render :sign_in, status: :unprocessable_entity
    end
  end

  def sign_in
  end

  def edit
  end

  def profile
  end

  def account
  end

  def update
    if @current_user.update(user_params)
      flash[:notice] = "プロフィールを更新しました"
      redirect_to("/users/profile")
    else
      render :profile, status: :unprocessable_entity
    end
  end

  def password_update
    @email = params[:email]
    @now_password = params[:now_password]

    if @email == @current_user.email && @current_user.authenticate(params[:now_password])
      password_change
    else
      @error_message = 'メールアドレスまたは現在のパスワードが間違っています'
      render :edit, status: :unprocessable_entity
    end
  end

  def logout
    session[:user_id] = nil
    flash[:notice] = "ログアウトしました"
    redirect_to("/")
  end
end

private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :image_name, :introduction)
end

def password_change
  @new_password = params[:password]
  @new_password_confirmation = params[:password_confirmation]

  if @new_password == @new_password_confirmation
    @current_user.password = @new_password
    @current_user.save
    flash[:notice] = 'パスワードを変更しました'
    redirect_to('/users/account')
  else
    @error_message = '変更後のパスワードを正しく入力して下さい'
    render :edit, status: :unprocessable_entity
  end
end
