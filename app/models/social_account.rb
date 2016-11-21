class SocialAccount < ContactMethod

  # Attributes
  field :username, type: String
  field :service, type: String

  # Validations
  validates :username, presence: true
  validates :service, presence: true

  def value
    return self.username
  end

  def cache_id
    return :social
  end

end
