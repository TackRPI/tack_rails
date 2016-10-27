attributes :_id, :pref, :label, :errors

# Address
attributes :formatted, :streetAddress, :locality, :region, :postalCode, :country, :if => lambda { |m| m.formatted? }

# Email
attributes :email, :if => lambda { |m| m.email? }

# Phone
attributes :phone, :if => lambda { |m| m.phone? }
