# TODO - document
class UpdateDispatch
  include Mongoid::Document
  include Mongoid::Timestamps

  # Attributes
  field :label, type: String
  field :cache, type: Hash

  # Relations
  belongs_to :user, class_name: 'User'

  # Validations
  # TODO

end
