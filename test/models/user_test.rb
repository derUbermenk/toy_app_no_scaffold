require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @new_user = User.new(name: 'Rabbit', email: 'Ruby@reddit.com')
    @old_user = User.create(name: 'rust', email: 'ruby@rust.com') 
  end

  test 'valid with correct attributes' do
    assert @new_user.valid?
  end

  test 'invalid without name' do
    @new_user.name = nil
    assert_not @new_user.valid?
  end

  test 'invalid when other user have similar email' do
    @new_user.email = nil
    assert_not @new_user.valid?
  end
end
