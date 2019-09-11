class ArticleDecorator < Draper::Decorator
  delegate_all

  def author_name
    [object.user.first_name, object.user.last_name].join(' ')
  end
end
