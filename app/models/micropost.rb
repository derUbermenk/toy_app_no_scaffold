class Micropost < ApplicationRecord
  validates :content, length: { maximum: 144 }, presence: true

  belongs_to :user
end
