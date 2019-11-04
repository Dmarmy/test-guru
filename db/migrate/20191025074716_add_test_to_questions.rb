# frozen_string_literal: true

class AddTestToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_reference :questions, :test, foreign_key: true
  end
end
