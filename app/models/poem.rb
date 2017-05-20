class Poem < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true
end
