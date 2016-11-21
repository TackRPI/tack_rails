# CreatedBy concern definition
# Abstraction used by the ContactMethod class definition to define its user relation
module CreatedBy
  extend ActiveSupport::Concern

  included do
    belongs_to :created_by, class_name: 'User'
  end

end
