# TODO - document
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
  def set_formatted
    self.formatted = "#{self.streetAddress}\n#{self.locality}, #{self.region} #{self.postalCode}\n#{self.country}"
  end

  def value
    return self.formatted
  end

  def cache_id
    return :address
  end

end
