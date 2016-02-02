class ExamsController < ApplicationController
  load_and_authorize_resource
  def index
    @subjects = Subject.all 
    @exam = Exam.new
  end

  def new
  end

  def show
    @exam.update_attributes status: :testing if @exam.start?
  end

  def create
    @exam = current_user.exams.build exam_params
    if @exam.save
      flash[:sucess] = t "flash.created_xam_success"
    else
      flash[:danger] = t "flash.created_xam_failed"
    end
    redirect_to exams_path
  end

  private
  def exam_params
    params.require(:exam).permit :subject_id, :duration, :status, :number_question
  end
end
