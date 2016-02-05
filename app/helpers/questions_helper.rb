module QuestionsHelper
  def question_status question
    content_tag :div, "#{question.status}",
    class: question.waitting? ? ["label", "label-warning"] : ["label", "label-success"]
  end
end
