class SocialAccount < ContactMethod

  # Attributes
  field :username, type: String
  field :service, type: String

  # Validations
  validates :username, presence: true
  validates :service, presence: true

  def cache_id
    return :social
  end

  def to_cache
    cache = {
      pref:       self.pref,
      label:      self.label,
      username:   self.username,
      service:    self.service
    }
    return cache
  end

end
