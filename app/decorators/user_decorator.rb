class UserDecorator < Draper::Decorator
  delegate_all
  decorates :user

  def self.collection_decorator_class
    PaginatingDecorator
  end

end
