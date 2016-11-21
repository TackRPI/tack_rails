# UpdateDispatch model definition
# Manages UpdateDispatch attributes, relations, and validations
# Any associated actions with this model occur in its related model class definitions
class UpdateDispatch
  include Mongoid::Document
  include Mongoid::Timestamps

  # Attributes
  field :label, type: String
  field :cache, type: Hash

  # Relations
  belongs_to :user, class_name: 'User'
  belongs_to :share_profile, class_name: 'ShareProfile'

  # Validations
  validates :label, presence: true
  validates :user, presence: true, uniqueness: { scope: :share_profile }

end
