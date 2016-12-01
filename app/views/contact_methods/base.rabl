node(:_id) { |item| item._id.to_s }
attributes :pref, :label, :errors

# Address
attributes :formatted, :streetAddress, :locality, :region, :postalCode, :country, :if => lambda { |m| m.formatted? }

# Email
attributes :email, :if => lambda { |m| m.email? }

# Phone
attributes :phone, :if => lambda { |m| m.phone? }

# Social
attributes :username, :service, :if => lambda { |m| m.username? }
