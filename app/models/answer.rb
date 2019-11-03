class Answer < ApplicationRecord
  belongs_to :question, optional: true

  validates :text, presence: true
  validates :validate_answers_number

  scope :correct_answers, -> { where(correct: true) }

  private

  def validate_answers_number
    return if question.answers.count < 4

    errors.add(:question, 'Not a valid number of answers per question')
  end
end
