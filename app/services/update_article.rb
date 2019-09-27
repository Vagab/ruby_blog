class UpdateArticle

  class Result < Struct.new(:success, :article)
    def success?
      success == true
    end
  end

  def initialize(attributes:, article:)
    @attributes = attributes
    @article = article
  end

  def call
    # TODO: to method
    tags = @attributes[:comma_separated_tags].downcase.split(',')
    tags.each do |t|
      Tag.find_or_create_by(name: t)
    end
    article_tags = Tag.where(name: tags)
    @attributes[:tags] = article_tags

    @article.attributes = @attributes
    @article.save!
    Result.new(true, @article)
  rescue ActiveRecord::RecordInvalid => e
    Result.new(false, @article)
  end

end
