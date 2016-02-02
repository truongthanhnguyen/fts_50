module ExamHelper
  def exam_status exam
    if exam.start?
      content_tag :div, "#{exam.status}", class: ["label", "label-primary"]
    elsif exam.testing?
      content_tag :div, "#{exam.status}", class: ["label", "label-warning"]
    elsif  exam.checked?
      content_tag :div, "#{exam.status}", class: ["label", "label-success"]
    else
      content_tag :div, "#{exam.status}", class: ["label", "label-info"]
    end 
  end
end
