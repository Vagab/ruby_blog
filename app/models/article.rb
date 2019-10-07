class Article < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :tags

  attribute :comma_separated_tags, :string
  validates :title, :description, presence: true

  def comma_separated_tags
    self.tags.pluck(:name)*','
  end

end
