class Article < ApplicationRecord

  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  scope :ordered, -> { order(id: :desc) }
  broadcasts_to ->(article) { "articles" }, inserts_by: :prepend
end