class ShareProfile
  include Mongoid::Document
  include Mongoid::Timestamps
  include CreatedAndUpdatedBy

  # Callbacks
  before_save :cache_contact_methods

  # Attributes
  field :label, type: String
  field :cached, type: Hash

  # Relations
  belongs_to  :user, class_name: 'User'
  has_and_belongs_to_many :contact_methods, class_name: 'ContactMethod', inverse_of: nil

  # Validations
  validates :label, presence: true, uniqueness: true # TODO - uniqueness per-user

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
    update = UpdateDispatch.create({ label: 'Alex\'s ' + self.label, cache: methodCache })


  end

end
