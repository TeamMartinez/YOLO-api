ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...


  # generate valid auth and use it elsewhere
  def test_verify_auth_valid
  end

  # generate invalid auth, 403
  def test_verify_auth_invalid
  end


end
