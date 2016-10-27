module CreatedAndUpdatedBy
  extend ActiveSupport::Concern

  included do
    # QUESTION - field, or relation?
    field :created_by, type: String
    field :updated_by, type: String
    validates :created_by, presence: true
    validates :updated_by, presence: true
  end

end
