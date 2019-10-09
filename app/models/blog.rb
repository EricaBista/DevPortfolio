class Blog < ApplicationRecord
  extend FriendlyId

  belongs_to :topic

  validates_presence_of :title, :body
  enum status: { Draft: 0, Published: 1 }
  friendly_id :title, use: :slugged
end
