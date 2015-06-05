require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest
  test "layout links" do
    get root_path
    assert_select "a[href=?]", movies_path
    assert_select "a[href=?]", new_user_registration_path, count: 2
    assert_select "a[href=?]", new_user_session_path, count: 2
    assert_select "footer.navbar-fixed-bottom"
  end
end
