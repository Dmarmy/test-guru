class User < ApplicationRecord
  EMAIL_FORMAT = /\A[a-zA-Z0-9\-_.]+@[a-zA-Z0-9\-_.]+\z/

  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id, dependent: :nullify
  has_many :gists, dependent: :destroy
  has_many :user_badges, dependent: :delete_all
  has_many :badges, through: :user_badges

  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :validatable,
         :trackable,
         :confirmable

  def tests_passed(level)
    tests.where(tests: { level: level })
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end

  def successful_tests
    self.test_passages.where(current_question: nil).select(&:passed_successfully?)
  end

  def admin?
    is_a?(Admin)
  end

  def to_s
    full_name = first_name.to_s
    full_name += " #{last_name}" if last_name.to_s.present?
    full_name += " (#{name})" if full_name.to_s.present? && name.to_s.present?
    full_name = name if full_name.to_s.empty?
    full_name = email if full_name.to_s.empty?
    full_name
  end
end
