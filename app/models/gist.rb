class Gist < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :question

  validates :gist_url, presence: true

  def gist_hash
    gist_url.split('/').last
  end
end
