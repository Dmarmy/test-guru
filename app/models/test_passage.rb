class TestPassage < ApplicationRecord
  SUCCESS_PASSAGE = 85

  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: 'Question', optional: true

  before_validation :before_validation_set_current_question

  def accept!(answer_ids)
    self.correct_questions += 1 if correct_answer?(answer_ids)
    save!
  end

  def number_of_questions
    test.questions.count
  end

  def progress
    test.questions.index(current_question) + 1
  end

  def current_question_number
    test.questions.order(:id).where('id < ?', current_question.id).count + 1
  end

  def completed?
    current_question.nil?
  end

  def passed_successfully?
    success_rate >= SUCCESS_PASSAGE
  end

  def success_rate
    ((correct_questions * 100) / test.questions.count.to_f)
  end

  private

  def next_question
    if new_record?
      test.questions.first
    else
      test.questions.order(:id).where('id > ?', current_question.id).first
    end
  end

  def correct_answer?(answer_ids)
    correct_answers_count = right_answers.count
    (correct_answers_count == right_answers.where(id: answer_ids).count) &&
      correct_answers_count == answer_ids.count
  end

  def right_answers
    current_question.answers.correct_answers
  end

  def before_validation_set_current_question
    self.current_question = next_question
  end
end
