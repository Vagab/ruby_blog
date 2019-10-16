class CreateArticle

  class Result < Struct.new(:success, :article)
    def success?
      success == true
    end
  end

  def initialize(attributes:)
    @attributes = attributes
  end

  def add_slug()
    @attributes[:slug] = @attributes[:title].parameterize
      .concat("-#{Time.now.strftime('%d-%m-%Y')}")
  end

  def call
    add_slug()
    article = Article.new(@attributes)
    article.save!
    Result.new(true, article)
  rescue ActiveRecord::RecordInvalid => e
    Result.new(false)
  end

end
