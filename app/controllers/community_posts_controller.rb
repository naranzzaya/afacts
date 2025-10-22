class CommunityPostsController < ApplicationController
  before_action :set_community_post, only: %i[ show edit update destroy ]

  # GET /community_posts
  def index
    @community_posts = CommunityPost.all
  end

  # GET /community_posts/1
  def show
  end

  # GET /community_posts/new
  def new
    @community_post = CommunityPost.new
  end

  # GET /community_posts/1/edit
  def edit
  end

  # POST /community_posts
  def create
    @community_post = CommunityPost.new(community_post_params)

    if @community_post.save
      redirect_to @community_post, notice: "Community post was successfully created."
    else
      render :new, status: :unprocessable_content
    end
  end

  # PATCH/PUT /community_posts/1
  def update
    if @community_post.update(community_post_params)
      redirect_to @community_post, notice: "Community post was successfully updated.", status: :see_other
    else
      render :edit, status: :unprocessable_content
    end
  end

  # DELETE /community_posts/1
  def destroy
    @community_post.destroy!
    redirect_to community_posts_path, notice: "Community post was successfully destroyed.", status: :see_other
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_community_post
      @community_post = CommunityPost.find(params.expect(:id))
    end

    # Only allow a list of trusted parameters through.
    def community_post_params
      params.expect(community_post: [ :user_id, :title, :body, :post_type, :status ])
    end
end
