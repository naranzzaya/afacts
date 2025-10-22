require "application_system_test_case"

class CommunityPostsTest < ApplicationSystemTestCase
  setup do
    @community_post = community_posts(:one)
  end

  test "visiting the index" do
    visit community_posts_url
    assert_selector "h1", text: "Community posts"
  end

  test "should create community post" do
    visit community_posts_url
    click_on "New community post"

    fill_in "Body", with: @community_post.body
    fill_in "Post type", with: @community_post.post_type
    fill_in "Status", with: @community_post.status
    fill_in "Title", with: @community_post.title
    fill_in "User", with: @community_post.user_id
    click_on "Create Community post"

    assert_text "Community post was successfully created"
    click_on "Back"
  end

  test "should update Community post" do
    visit community_post_url(@community_post)
    click_on "Edit this community post", match: :first

    fill_in "Body", with: @community_post.body
    fill_in "Post type", with: @community_post.post_type
    fill_in "Status", with: @community_post.status
    fill_in "Title", with: @community_post.title
    fill_in "User", with: @community_post.user_id
    click_on "Update Community post"

    assert_text "Community post was successfully updated"
    click_on "Back"
  end

  test "should destroy Community post" do
    visit community_post_url(@community_post)
    click_on "Destroy this community post", match: :first

    assert_text "Community post was successfully destroyed"
  end
end
