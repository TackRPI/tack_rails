class ShareProfile
  include Mongoid::Document
  include Mongoid::Timestamps
  include CreatedBy

  # Callbacks
  before_save :cache_contact_methods

  # Attributes
  field :label, type: String
  field :cached, type: Hash

  # Relations
  has_and_belongs_to_many :contact_methods, class_name: 'ContactMethod'

  # Validations
  validates :label, presence: true, uniqueness: { scope: :created_by } # TODO - document created_by scope

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

    # Creates UpdateDispatch
    # update = UpdateDispatch.create({ label: 'Alex\'s ' + self.label, cache: methodCache })

  end

  def send_update_dispatch_to(user_id) # TODO - include sender information
    update = UpdateDispatch.create({ user_id: user_id, label: 'Alex\'s ' + self.label, cache: self.cached })
  end

end
