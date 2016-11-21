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
  validates :label, presence: true, uniqueness: { scope: :created_by } # TODO - document created_by scope
  validates :created_by, presence: true
  # TODO - any other validations?

  # Caches Contact Methods
  def cache_contact_methods

    # Return if no contact_methods are present
    if self.contact_methods.length == 0
      return
    end

    # Array of methods
    # TODO - this will be 1 array per ContactMethod Type
    methodCache = Hash.new()
    methods = Array.new()

    # Iterates over contact methods
    self.contact_methods.each do |c|

      cache = {
        pref:   c.pref,
        label:  c.label,
        value:  c.value, # TODO - is this how we want to handle this? We might want a 'toCache' method rather than 'value' on each model
      }

      methods << cache

    end

    # Assigns methods to cache hash
    methodCache[:methods] = methods

    # Updates self with cached
    self.cached = methodCache
    return true

  end

  # TODO - this should happen in a Resque task
  # Builds and UpdateDispatch
  # TODO - this should happen in a Resque task that accepts the user and the share profile
  def build_update_dispatches
    puts 'TODO - build update dispatches after this is saved / updated'
    # x = FindOrCreate
    self.linked_users.each do |u|
      UpdateDispatch.create({ user: u, label: created_by.display_name + ' - ' + self.label, cache: self.cached, share_profile: self })
    end

  end

end
