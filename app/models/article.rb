class Article < ApplicationRecord
  validates :title, :description, presence: true
end
