class UpdateArticle

  class Result < Struct.new(:success, :article)
    def success?
      success == true
    end
  end

  attr_reader :attributes

  def initialize(attributes:, article:)
    @attributes = attributes
    @article = article
  end

  def call
    @article.attributes = @attributes
    @article.save!
    Result.new(true, @article)
  rescue ActiveRecord::RecordInvalid => e
    Result.new(false, @article)
  end

end
