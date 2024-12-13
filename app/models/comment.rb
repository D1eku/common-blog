class Comment < ApplicationRecord
  belongs_to :task

  validates :content, presence: true
  validates :task, presence: true
  validates :creator, presence: true
end
