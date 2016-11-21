# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

# # # # # # # # # # # # # # # # # # # #

# Users
alex = User.create({ email: 'alex@gmail.com', password: 'topsecret', password_confirmation: 'topsecret', username: 'alex', display_name: 'Alexander Schwartzberg' })
blake = User.create({ email: 'blake@gmail.com', password: 'topsecret', password_confirmation: 'topsecret', username: 'blake', display_name: 'Blake Lingenau' })
dylan = User.create({ email: 'dylan@gmail.com', password: 'topsecret', password_confirmation: 'topsecret', username: 'dylan', display_name: 'Dylan Lingenau' })
ranjit = User.create({ email: 'ranjit@gmail.com', password: 'topsecret', password_confirmation: 'topsecret', username: 'ranjit', display_name: 'Ranjit Marathay' })

# # # # # # # # # # # # # # # # # # # #

# Alex's ContactMethods
alex_email = EmailAddress.create({
  label:      'GMail',
  email:      'alex@gmail.com',
  created_by: alex
})

alex_phone = PhoneNumber.create({
  label:      'Cell',
  phone:      '555-555-5555',
  created_by: alex
})

alex_address = Address.create({
  label:          'Home',
  streetAddress:  'Alex House',
  locality:       'Los Angeles',
  region:         'CA',
  postalCode:     '12345',
  country:        'USA',
  created_by:     alex
})

email_and_phone = ShareProfile.create({
  label:            'Email & Phone',
  created_by:       alex,
  contact_methods:  [alex_email, alex_phone],
  linked_users:     [dylan, ranjit]
})

phone_and_address = ShareProfile.create({
  label:            'Phone & Address',
  created_by:       alex,
  contact_methods:  [alex_phone, alex_address],
  linked_users:     [blake, ranjit]
})

# # # # # # # # # # # # # # # # # # # #

# Blake's ContactMethods
blake_email = EmailAddress.create({
  label:      'GMail',
  email:      'blake@gmail.com',
  created_by: blake
})

blake_phone = PhoneNumber.create({
  label:      'Cell',
  phone:      '555-555-5555',
  created_by: blake
})

blake_address = Address.create({
  label:          'Home',
  streetAddress:  'Blake House',
  locality:       'Los Angeles',
  region:         'CA',
  postalCode:     '12345',
  country:        'USA',
  created_by:     blake
})

email_and_phone = ShareProfile.create({
  label:            'Email & Phone',
  created_by:       blake,
  contact_methods:  [blake_email, blake_phone],
  linked_users:     [ranjit, alex]
})

phone_and_address = ShareProfile.create({
  label:            'Phone & Address',
  created_by:       blake,
  contact_methods:  [blake_phone, blake_address],
  linked_users:     [dylan, alex]
})

# # # # # # # # # # # # # # # # # # # #

# Dylan's ContactMethods
dylan_email = EmailAddress.create({
  label:      'GMail',
  email:      'dylan@gmail.com',
  created_by: dylan
})

dylan_phone = PhoneNumber.create({
  label:      'Cell',
  phone:      '555-555-5555',
  created_by: dylan
})

dylan_address = Address.create({
  label:          'Home',
  streetAddress:  'Dylan House',
  locality:       'Los Angeles',
  region:         'CA',
  postalCode:     '12345',
  country:        'USA',
  created_by:     dylan
})

email_and_phone = ShareProfile.create({
  label:            'Email & Phone',
  created_by:       dylan,
  contact_methods:  [dylan_email, dylan_phone],
  linked_users:     [ranjit, blake]
})

phone_and_address = ShareProfile.create({
  label:            'Phone & Address',
  created_by:       dylan,
  contact_methods:  [dylan_phone, dylan_address],
  linked_users:     [alex, blake]
})

# # # # # # # # # # # # # # # # # # # #

# Ranjit's ContactMethods
ranjit_email = EmailAddress.create({
  label:      'GMail',
  email:      'ranjit@gmail.com',
  created_by: ranjit
})

ranjit_phone = PhoneNumber.create({
  label:      'Cell',
  phone:      '555-555-5555',
  created_by: ranjit
})

ranjit_address = Address.create({
  label:          'Home',
  streetAddress:  'Ranjit House',
  locality:       'Los Angeles',
  region:         'CA',
  postalCode:     '12345',
  country:        'USA',
  created_by:     ranjit
})

email_and_phone = ShareProfile.create({
  label:            'Email & Phone',
  created_by:       ranjit,
  contact_methods:  [ranjit_email, ranjit_phone],
  linked_users:     [blake, dylan]
})

phone_and_address = ShareProfile.create({
  label:            'Phone & Address',
  created_by:       ranjit,
  contact_methods:  [ranjit_phone, ranjit_address],
  linked_users:     [alex, dylan]
})
