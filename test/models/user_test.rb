require "test_helper"

class UserTest < ActiveSupport::TestCase
  test 'valid with correct attributes' do
    user = User.new(name: 'Rabbit', email: 'Ruby@reddit.com')
    assert user.valid?
  end

  test 'invalid without name' do
    user = User.new(name: 'Rabbit', email: 'Ruby@reddit.com')
    user.name = nil
    refute user.valid?
  end

  test 'invalid when other user have similar email' do
    user = User.new(name: 'Rabbit', email: 'Ruby@reddit.com')
    user.email = nil
    refute user.valid?
  end
end
