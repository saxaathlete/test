# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_cherry.dkp_session',
  :secret      => '0d1280df55207d160bc94fa1c46cde010bdfa82bb184cb6e4d24d24392483c08d694868f90a15150c7b62bfe5669df730e0dc7f352dd09616ad8419c26784283'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
