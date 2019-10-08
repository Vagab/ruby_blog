class UsefulLink < ApplicationRecord
  validates :description, :url, presence: true

  paginates_per 15

end
