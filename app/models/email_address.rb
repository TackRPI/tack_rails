class EmailAddress < ContactMethod

  # Attributes
  field :email, type: String

  # Validations
  validates :email, presence: true, uniqueness: { scope: :created_by } # TODO - custom validation for email

  def cache_id
    return :email
  end

  def to_cache
    cache = {
      pref:   self.pref,
      label:  self.label,
      email:  self.email
    }
    return cache
  end

end
