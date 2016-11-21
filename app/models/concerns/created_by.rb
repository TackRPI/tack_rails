# TODO - document
module CreatedBy
  extend ActiveSupport::Concern

  included do
    belongs_to :created_by, class_name: 'User'
  end

end
