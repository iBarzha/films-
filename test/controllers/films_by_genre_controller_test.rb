require "test_helper"

class FilmsByGenreControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get films_by_genre_index_url
    assert_response :success
  end
end
