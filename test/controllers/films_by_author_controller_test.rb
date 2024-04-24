require "test_helper"

class FilmsByAuthorControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get films_by_author_index_url
    assert_response :success
  end
end
