class User < ApplicationRecord
  def tests_passed(level)
    tests.where(tests: { level: level })
  end
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: tests_users, dependent: :destroy
  has_many :created_tests, class_name: :Test, foreign_key: :author_id, dependent: :nullify
end
