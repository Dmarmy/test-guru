class User < ApplicationRecord
  has_many :tests_users, dependent: :destroy
  has_many :tests, through: :tests_users
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify

  validates :name, :password, presence: true

  def tests_passed(level)
    tests.where(tests: { level: level })
  end
end
