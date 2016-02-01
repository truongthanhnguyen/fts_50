User.create!(name: "Example User", email: "example@railstutorial.org",
  password: "12345678", password_confirmation: "12345678", role: 1)

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
