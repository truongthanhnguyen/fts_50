class Admin::ExamsController < ApplicationController
  load_and_authorize_resource
  
  def index
    @exams = @exams.paginate(page: params[:page]).order created_at: :desc
  end
end
