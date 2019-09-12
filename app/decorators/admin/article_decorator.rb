class Admin::ArticleDecorator < Draper::Decorator
  delegate_all

  def title
    [object.title, status].join(' ')
  end

  def status
    '(unpublished)' if not object.published
  end
end
