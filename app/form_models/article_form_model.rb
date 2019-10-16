class ArticleFormModel < ApplicationRecord

  attr_accessor :title, :description, :published, :comma_separated_tags

  # validates :title, :description, presence: true

end
