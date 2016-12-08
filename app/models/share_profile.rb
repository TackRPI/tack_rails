
# ShareProfile model definition
# Manages ShareProfile attributes, relations, and validations
# Includes before_save and after_save callbacks to manage background operations
class ShareProfile
  include Mongoid::Document
  include Mongoid::Timestamps

  # Callbacks
  before_save :cache_contact_methods
  after_save  :build_update_dispatches

  # Attributes
  field :label, type: String
  field :cached, type: Hash

  # Relations
  belongs_to :created_by, class_name: 'User', inverse_of: :share_profiles
  has_and_belongs_to_many :linked_users, class_name: 'User', inverse_of: :linked_profiles
  has_and_belongs_to_many :contact_methods, class_name: 'ContactMethod'
  has_many :update_dispatches, class_name: 'UpdateDispatch'

  # Validations
  validates :label, presence: true, uniqueness: { scope: :created_by }
  validates :created_by, presence: true

  def created_by_name
    self.created_by.display_name
  end

  # Caches Contact Methods
  def cache_contact_methods

    # Return if no contact_methods are present
    if self.contact_methods.length == 0
      return
    end

    # Array of methods
    methodCache = {
      phone:    Array.new(),
      email:    Array.new(),
      address:  Array.new(),
      social:   Array.new()
    }

    # Iterates over contact methods
    self.contact_methods.each do |c|

      # Builds cache for each ContactMethod
      # Assignes to correct array
      # uses cache_id method on ContactMethod subclasses
      methodCache[c.cache_id] << c.to_cache()

    end

    # Updates self with cached
    self.cached = methodCache
    return true

  end

  # Builds and UpdateDispatch models from ShareProfile (self)
  def build_update_dispatches
    self.linked_users.each do |u|
      update = UpdateDispatch.find_or_create_by({ user: u, share_profile: self })
      update.set({ label: created_by.display_name, cache: self.cached })
      update.save()
    end
  end

end
