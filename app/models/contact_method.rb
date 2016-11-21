# ContactMethod model definition
# Manages ContactMethod attributes, relations, and validations
# Includes before_save and after_destroy callbacks to manage background operations
class ContactMethod
  include Mongoid::Document
  include Mongoid::Timestamps
  include CreatedBy

  # Callbacks
  after_save :update_share_profiles
  after_destroy :update_share_profiles

  # Attributes
  field :label, type: String
  field :pref,  type: Boolean, default: false

  # Relations
  has_and_belongs_to_many :share_profiles, class_name: 'ShareProfile'

  # Validations
  validates :label, presence: true

  def update_share_profiles
    self.share_profiles.each { |p| p.save() }
    return true
  end

end
