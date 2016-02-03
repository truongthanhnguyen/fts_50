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

  def spent_time exam
    if exam.time_end - exam.time_start < exam.duration * Settings.MINUTE
      time = exam.time_end - exam.time_start
    else
      time = exam.duration * Settings.MINUTE
    end
    Time.at(time).utc.strftime I18n.t("exams.format_time")
  end

  def start_time exam
    if exam.start? or exam.time_end.nil?
      content_tag :p, "00:00:00"
    else
      spent_time exam
    end
  end
end
