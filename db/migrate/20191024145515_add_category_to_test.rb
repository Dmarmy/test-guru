# frozen_string_literal: true

class AddCategoryToTest < ActiveRecord::Migration[6.0]
  def change
    add_column :tests, :category_id, :integer
  end
end
