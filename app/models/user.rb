class User < ApplicationRecord
  def tests_passed(level)
    Test.joins(' JOIN user_tests ON tests.id = user_tests.test_id')
        .where(tests: { level: level }, user_tests: { user_id: id })
  end
end
