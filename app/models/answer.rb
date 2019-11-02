class Answer < ApplicationRecord
  belongs_to :question, optional: true

  scope :correct_answers, -> { where(correct: true) }
end
