class Admin::ArticleDecorator < Draper::Decorator
  delegate_all
  
  def status
    object.published ? '(published)' : '(unpublished)'
  end
end
