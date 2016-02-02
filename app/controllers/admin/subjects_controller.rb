class Admin::SubjectsController < ApplicationController
  load_and_authorize_resource

  def index
    @subjects = @subjects.paginate page: params[:page]
  end

  def edit
  end

  def update
    if @subject.update_attributes subject_params
      flash[:success] = t "admin.subject.update_success"
      redirect_to admin_root_url
    else
      render :edit
    end
  end

  def destroy
    @subject.destroy
    flash[:success] = t "admin.subject.destroy_success"
    redirect_to admin_root_url
  end

  def create
    if @subject.save
      flash[:success] = t "admin.subject.created_subject"
      redirect_to admin_root_url
    else
      render :new
    end
  end

  def new
  end

  private
  def subject_params
    params.require(:subject).permit :content, :description
  end
end
