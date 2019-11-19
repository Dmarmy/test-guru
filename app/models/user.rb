class User < ApplicationRecord
  EMAIL_FORMAT = /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  has_secure_password

  validates :email, presence: true, uniqueness: true, format: { with: EMAIL_FORMAT }

  def tests_passed(level)
    tests.where(tests: { level: level })
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
end
