require "test_helper"

class MicropostTest < ActiveSupport::TestCase
  def setup
    @user = User.create(name: 'ruby', email: 'ruby@reddit.com')
    @micropost = @user.microposts.build(content: 'many')
  end

  test 'valid with right attributes' do
    assert @micropost.valid?
  end

  test 'invalid without content' do
    @micropost.content = nil
    assert_not @micropost.valid?
  end

  test 'invalid when longer than 144' do
    @micropost.content = Array.new(145, 'a').join 
    assert_not @micropost.valid?
  end

  test 'invalid without user' do
    @micropost.user = nil
    assert_not @micropost.valid?
  end
end
