# Address class definition
# Subclassed from ContactMethod
# Manages Address-specific attributes and helper methods
class Address < ContactMethod

  # Callbacks
  before_validation :set_formatted

  # Attributes
  field :formatted, type: String
  field :streetAddress, type: String # Address
  field :locality, type: String # City
  field :region, type: String # State
  field :postalCode, type: String
  field :country, type: String

  # Validations
  validates :formatted, presence: true
  validates :streetAddress, presence: true
  validates :locality, presence: true
  validates :region, presence: true
  validates :postalCode, presence: true
  validates :country, presence: true

  # Sets formatted attribute
  # Complete address as a single string
  def set_formatted
    self.formatted = "#{self.streetAddress}\n#{self.locality}, #{self.region} #{self.postalCode}\n#{self.country}"
  end

  def cache_id
    return :address
  end

  def to_cache
    cache = {
      pref:           self.pref,
      label:          self.label,
      formatted:      self.formatted,
      streetAddress:  self.streetAddress,
      locality:       self.locality,
      region:         self.region,
      postalCode:     self.postalCode,
      country:        self.country
    }
    return cache
  end

end
