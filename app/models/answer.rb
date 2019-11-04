# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true
  validate :validate_answers_number, on: :create

  scope :correct_answers, -> { where(correct: true) }

  private

  def validate_answers_number
    return if question.answers.count < 4

    errors.add(:question_id, 'Not a valid number of answers per question')
  end
end
