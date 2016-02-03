class ExamsController < ApplicationController
  load_and_authorize_resource
  def index
    @subjects = Subject.all 
    @exam = Exam.new
  end

  def new
  end

  def show
    if @exam.start?
      @time_start = Time.now.to_i
      @exam.update_attributes time_start: @time_start, status: :testing
    else
      @time_start = @exam.time_start
    end
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

  def update
    @exam.status = params[:commit] == "Finish" ? :unchecked : :saved
    @exam.time_end = Time.now.to_i
    if @exam.update_attributes exam_params
      flash.now[:success] = t "flashs.finished"
      redirect_to exams_path
    else
      flash.now[:danger] = t "flashs.error_finished"
      redirect_to :back
    end
  end

  private
  def exam_params
    params.require(:exam).permit :subject_id, :status,
      results_attributes: [:id, :answer_id]      
  end
end
