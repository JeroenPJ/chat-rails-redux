class Message < ApplicationRecord
  belongs_to :user
  belongs_to :channel

  validates :content, presence: true

  def to_api
    {
      id: id,
      author: self.user.email,
      content: content,
      created_at: created_at
    }
  end
end
