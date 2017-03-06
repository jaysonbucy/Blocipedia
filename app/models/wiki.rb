class Wiki < ApplicationRecord
  belongs_to :user

  has_many :wiki_collaborators
  has_many :collaborators, through: :wiki_collaborators, source: 'user'

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
end
