10.times do |n|
  @user = FactoryGirl.create(:user)
  @subject = FactoryGirl.create(:subject)
  10.times do |n|
    @question = FactoryGirl.create(:question, subject: @subject)
    3.times do |n|
      @answer = FactoryGirl.create(:answer, question: @question)
    end
    FactoryGirl.create(:answer, question: @question, correct_answer: true)
  end
end
