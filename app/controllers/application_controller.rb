class ApplicationController < ActionController::Base
  include ExamsHelper
  include QuestionsHelper
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end
end
