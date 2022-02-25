require "test_helper"

class MicropostsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @user = User.create(name: 'email', email: 'email@name.com')
    @micropost = @users.microposts.create(content:'email')
  end

  test 'should get index' do
    get microposts_index_url
    assert_response :success
  end

  test 'should get show' do
    get microposts_url(@micropost)
    assert_response :success
  end
end
