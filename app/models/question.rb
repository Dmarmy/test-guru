class Question < ApplicationRecord
  belongs_to :test, optional: true
  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy

  validates :text, presence: true
end
