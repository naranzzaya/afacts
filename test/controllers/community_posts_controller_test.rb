require "test_helper"

class CommunityPostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @community_post = community_posts(:one)
  end

  test "should get index" do
    get community_posts_url
    assert_response :success
  end

  test "should get new" do
    get new_community_post_url
    assert_response :success
  end

  test "should create community_post" do
    assert_difference("CommunityPost.count") do
      post community_posts_url, params: { community_post: { body: @community_post.body, post_type: @community_post.post_type, status: @community_post.status, title: @community_post.title, user_id: @community_post.user_id } }
    end

    assert_redirected_to community_post_url(CommunityPost.last)
  end

  test "should show community_post" do
    get community_post_url(@community_post)
    assert_response :success
  end

  test "should get edit" do
    get edit_community_post_url(@community_post)
    assert_response :success
  end

  test "should update community_post" do
    patch community_post_url(@community_post), params: { community_post: { body: @community_post.body, post_type: @community_post.post_type, status: @community_post.status, title: @community_post.title, user_id: @community_post.user_id } }
    assert_redirected_to community_post_url(@community_post)
  end

  test "should destroy community_post" do
    assert_difference("CommunityPost.count", -1) do
      delete community_post_url(@community_post)
    end

    assert_redirected_to community_posts_url
  end
end
