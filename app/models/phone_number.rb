class PhoneNumber < ContactMethod

  # Attributes
  field :phone, type: String

  # Validations
  validates :phone, presence: true, uniqueness: true # TODO - custom validation

  def value
    return self.phone
  end

end
