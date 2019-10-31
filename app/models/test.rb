class Test < ApplicationRecord
  def self.test_list(category_name)
    joins(:category)
        .where(categories: { title: category_name })
        .order(tests DESC)
        .pluck(:title)
  end
  has_many :tests_users
  has_many :users, through: tests_users
  belongs_to :category, optional: true
  belongs_to :author, class_name: :User, foreign_key: :author_id, optional: true
  has_many :questions
end

