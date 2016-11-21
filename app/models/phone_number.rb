# PhoneNumber class definition
# Subclassed from ContactMethod
# Manages PhoneNumber-specific attributes and helper methods
class PhoneNumber < ContactMethod

  # Attributes
  field :phone, type: String

  # Validations
  validates :phone, presence: true, uniqueness: { scope: :created_by }

  def cache_id
    return :phone
  end

  def to_cache
    cache = {
      pref:   self.pref,
      label:  self.label,
      phone:  self.phone
    }
    return cache
  end

end
