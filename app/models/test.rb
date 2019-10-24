# frozen_string_literal: true

class Test < ApplicationRecord
  def self.test_list(category_name)
    joins(' JOIN categories ON tests.category_id = categories.id ')
      .where(categories: { title: category_name })
      .order('tests.id DESC')
      .pluck(:title)
  end
end
