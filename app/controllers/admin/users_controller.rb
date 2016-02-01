class Admin::UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = @users.paginate page: params[:page]
  end

  def show
  end

  def destroy
    if @user.destroy
      flash[:success] = t "admin.user.user_deleted"
    else
      flash[:danger] = t "admin.user.delete_failed"
    end
    redirect_to :back
  end
end
