class EmailAddress < ContactMethod

  # Attributes
  field :email, type: String

  # Validations
  validates :email, presence: true, uniqueness: true # TODO - custom validation for email

  def value
    return self.email
  end

end
