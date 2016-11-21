# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

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
  created_by: alex.id.to_s
})

alex_phone = PhoneNumber.create({
  label:      'Cell',
  phone:      '555-555-5555',
  created_by: alex.id.to_s
})

alex_address = Address.create({
  label:          'Home',
  streetAddress:  'Alex House',
  locality:       'Los Angeles',
  region:         'CA',
  postalCode:     '12345',
  created_by:     alex.id.to_s
})

email_and_phone = ShareProfile.create({
  label:              'Email & Phone',
  created_by:         alex.id.to_s,
  contact_method_ids: [alex_email.id.to_s, alex_phone.id.to_s]
})

# # # # # # # # # # # # # # # # # # # #

# Blake's ContactMethods
blake_email = EmailAddress.create({
  label:      'GMail',
  email:      'blake@gmail.com',
  created_by: blake.id.to_s
})

blake_phone = PhoneNumber.create({
  label:      'Cell',
  phone:      '555-555-5555',
  created_by: blake.id.to_s
})

blake_address = Address.create({
  label:          'Home',
  streetAddress:  'Blake House',
  locality:       'Los Angeles',
  region:         'CA',
  postalCode:     '12345',
  created_by:     blake.id.to_s
})

# # # # # # # # # # # # # # # # # # # #

# Dylan's ContactMethods
dylan_email = EmailAddress.create({
  label:      'GMail',
  email:      'dylan@gmail.com',
  created_by: dylan.id.to_s
})

dylan_phone = PhoneNumber.create({
  label:      'Cell',
  phone:      '555-555-5555',
  created_by: dylan.id.to_s
})

dylan_address = Address.create({
  label:          'Home',
  streetAddress:  'Dylan House',
  locality:       'Los Angeles',
  region:         'CA',
  postalCode:     '12345',
  created_by:     dylan.id.to_s
})

# # # # # # # # # # # # # # # # # # # #

# Ranjit's ContactMethods
ranjit_email = EmailAddress.create({
  label:      'GMail',
  email:      'ranjit@gmail.com',
  created_by: ranjit.id.to_s
})

ranjit_phone = PhoneNumber.create({
  label:      'Cell',
  phone:      '555-555-5555',
  created_by: ranjit.id.to_s
})

ranjit_address = Address.create({
  label:          'Home',
  streetAddress:  'Ranjit House',
  locality:       'Los Angeles',
  region:         'CA',
  postalCode:     '12345',
  created_by:     ranjit.id.to_s
})

