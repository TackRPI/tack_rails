# TODO - document
class ContactMethod
  include Mongoid::Document
  include Mongoid::Timestamps
  include CreatedBy

  # Callbacks
  after_save :update_share_profiles

  # Attributes
  field :label, type: String
  field :pref,  type: Boolean, default: false

  # Relations
  has_and_belongs_to_many :share_profiles, class_name: 'ShareProfile'

  # Validations
  validates :label, presence: true

  # TODO - update share profiles!
  def update_share_profiles
    puts 'update share profiles here'
    puts self.share_profile_ids
    return
  end

end
