# TODO - document
class UpdateDispatch
  include Mongoid::Document
  include Mongoid::Timestamps

  field :label, type: String
  field :cache, type: Hash

  belongs_to :user, class_name: 'User'

end
