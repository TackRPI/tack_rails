# TODO - document
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
