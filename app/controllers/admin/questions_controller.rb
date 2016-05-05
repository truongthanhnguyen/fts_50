class Admin::QuestionsController < ApplicationController
  load_and_authorize_resource

  def index
    @questions = @questions.paginate(page: params[:page])
  end

  def update
    if @question.update_attributes question_params
      flash[:success] = t "question.update_success"
      redirect_to admin_questions_path
    end
  end

  private
  def question_params
    params.require(:question).permit :status
  end
end
