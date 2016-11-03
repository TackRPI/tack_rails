class UpdateDispatch
  include Mongoid::Document
  include Mongoid::Timestamps

  field :label, type: String
  field :cache, type: Hash

  has_one :user, class_name: 'User'

end
