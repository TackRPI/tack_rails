class EmailAddress < ContactMethod

  # Attributes
  field :email, type: String

  # Validations
  validates :email, presence: true, uniqueness: { scope: :created_by } # TODO - custom validation for email

  def value
    return self.email
  end

end
