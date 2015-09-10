class UsersController < ApplicationController
  
  before_action :set_message, only: [:edit, :update, :destroy]
  
  def show
   @user = User.find(params[:id])
   @microposts = @user.microposts
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user
      flash[:success] = "Welcome to the Sample App!"
    else
      render 'new'
    end
  end
  
  def edit

  end
  
 def update
    if @user.update(user_params)
      # 保存に成功した場合はトップページへリダイレクト
      redirect_to root_path , notice: 'メッセージを編集しました'
    else
      # 保存に失敗した場合は編集画面へ戻す
      render 'edit'
    end
  end
 
  def set_message
    @user = User.find(params[:id])
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password,
                                  :password_confirmation, :area, :Profile)
  end
end
  
